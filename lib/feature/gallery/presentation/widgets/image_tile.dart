
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final int likesCount;
  final int commentsCount;
  const ImageTile({
    super.key,
    required this.imageUrl,
    required this.likesCount,
    required this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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