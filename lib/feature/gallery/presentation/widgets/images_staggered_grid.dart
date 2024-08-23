import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_of_images/core/utils/responsive.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/presentation/widgets/image_tile.dart';

class ImagesStaggeredGrid extends StatelessWidget {
  final List<ImageEntity> images;
  const ImagesStaggeredGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return StaggeredGrid.count(
      crossAxisCount: isMobile ? 2 : isTablet ? 3 : 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        for (var imageEntity in images)
          ImageTile(
            imageUrl: imageEntity.galleryUrl,
            likesCount: imageEntity.likesCount,
            commentsCount: imageEntity.commentsCount,
          ),
      ],
    );
  }
}
