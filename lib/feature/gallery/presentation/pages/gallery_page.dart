import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_of_images/core/utils/responsive.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:gallery_of_images/feature/gallery/presentation/widgets/images_staggered_grid.dart';
import 'package:gallery_of_images/feature/service_locator.dart';
import 'package:go_router/go_router.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final GalleryBloc _bloc = sl();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc.add(GalleryInitialEvent());
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(),
      body: SafeArea(
        child: BlocConsumer<GalleryBloc, GalleryState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state) {
              case GalleryInitial _:
                return const SizedBox();

              case GallerySuccess _:
                return _onSuccessState(_bloc.list);

              case GalleryError _:
                return _onErrorState();

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _fab() {
    return Visibility(
      visible: _scrollController.hasClients && _scrollController.offset > 100,
      child: FloatingActionButton(
        onPressed: () => _scrollToTop(),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget _onSuccessState(List<ImageEntity> images) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = Responsive.isDesktop(context);

    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? width * 0.12 : 16),
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
                  ),
                  const SizedBox(height: 24),
                  ImagesStaggeredGrid(
                    images: images,
                    onImageClick: (id) => context.push("/image/$id"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _onErrorState() {
    return const Center(
      child: Text("Error"),
    );
  }
}
