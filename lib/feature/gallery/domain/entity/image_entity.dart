class ImageEntity {
  final int id;
  final String galleryUrl;
  final String fullScreenUrl;
  final int likesCount;
  final int commentsCount;

  ImageEntity({
    required this.id,
    required this.galleryUrl,
    required this.fullScreenUrl,
    required this.likesCount,
    required this.commentsCount,
  });
}
