import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryScreen extends StatelessWidget {
  final String imageUrl;

  const PhotoViewGalleryScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white, // Set the background color to white
      insetPadding: EdgeInsets.zero, // Make the dialog fullscreen
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Remove circular borders
      ),
      child: Stack(
        children: [
          PhotoViewGallery.builder(
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
              color: Colors.white, // Set background color to white
            ),
            pageController: PageController(),
          ),
          Positioned(
            top: 24,
            left: 24,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black.withOpacity(0.7), // Adjust the color if needed
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white), // Close icon color
            ),
          ),
        ],
      ),
    );
  }
}
