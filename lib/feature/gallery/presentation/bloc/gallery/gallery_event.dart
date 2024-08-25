part of 'gallery_bloc.dart';

@immutable
sealed class GalleryEvent {}

class GalleryInitialEvent extends GalleryEvent {}
class GalleryLoadMoreEvent extends GalleryEvent {}
