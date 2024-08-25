import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_of_images/core/utils/responsive.dart';
import 'package:gallery_of_images/feature/gallery/presentation/bloc/gallery/gallery_bloc.dart';
import 'package:gallery_of_images/feature/gallery/presentation/widgets/images_staggered_grid.dart';
import 'package:gallery_of_images/feature/gallery/presentation/widgets/photo_view.dart';
import 'package:gallery_of_images/feature/service_locator.dart';
import 'package:go_router/go_router.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final GalleryBloc _bloc = sl();
  late final ScrollController _scrollController;

  bool _hasPagingCalled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _bloc.add(GalleryInitialEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          key: const Key("SingleChildScrollView"),
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? width * 0.12 : 16,
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: 'Search any images',
                  constraints: BoxConstraints(
                    maxWidth: isDesktop ? width / 1.6 : width / 1.3,
                    minHeight: 48,
                  ),
                  onSubmitted: (value) =>
                      _bloc.add(GallerySearchEvent(query: value)),
                ),
                const SizedBox(height: 24),
                BlocConsumer<GalleryBloc, GalleryState>(
                  bloc: _bloc,
                  listenWhen: (previous, current) =>
                      current is GalleryListener,
                  buildWhen: (previous, current) =>
                      current is! GalleryListener,
                  listener: (context, state) {
                    if (state is GalleryLoadMoreSuccessState) {
                      setState(() {});
                    }
                  },
                  builder: (context, state) {
                    if (state is GallerySuccess) {
                      return _onSuccessState();
                    } else if (state is GalleryError) {
                      return _onErrorState(state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _onSuccessState() {
    return Column(
      children: [
        ImagesStaggeredGrid(
          images: _bloc.images,
          onImageClick: (imageUrl) {
            _showPhotoView(context, imageUrl);
          },
        ),
      ],
    );
  }

  Widget _onErrorState(String message) {
    return Center(
      child: Text(message),
    );
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      double distanceToEnd = _scrollController.position.maxScrollExtent -
          _scrollController.position.pixels;
      if (distanceToEnd <= 0 && !_hasPagingCalled) {
        _bloc.add(GalleryLoadMoreEvent());
        _hasPagingCalled = true;
      } else if (distanceToEnd > 0) {
        _hasPagingCalled = false;
      }
    }
  }

  void _showPhotoView(BuildContext context, imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PhotoViewGalleryScreen(imageUrl: imageUrl);
      },
      barrierDismissible: true,
    );
  }
}
