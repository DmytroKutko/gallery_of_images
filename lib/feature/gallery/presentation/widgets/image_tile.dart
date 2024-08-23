import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final int likesCount;
  final int commentsCount;
  const ImageTile(
      {super.key,
      required this.imageUrl,
      required this.likesCount,
      required this.commentsCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPhotoView(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              height: 38,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black45,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                children: [
                  _socialIcon(Icons.favorite, likesCount),
                  _socialIcon(Icons.comment, commentsCount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhotoView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PhotoViewGalleryScreen(
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, int count) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 20,
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            "$count",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class PhotoViewGalleryScreen extends StatelessWidget {
  final String imageUrl;

  const PhotoViewGalleryScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24),
        child: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrl),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(),
      ),
    );
  }
}
