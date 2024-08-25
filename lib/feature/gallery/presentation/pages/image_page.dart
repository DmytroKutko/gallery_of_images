import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  final int id;
  const ImagePage({super.key, required this.id});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Image page ${widget.id}"),
            ],
          ),
        ),
      ),
    );
  }
}
