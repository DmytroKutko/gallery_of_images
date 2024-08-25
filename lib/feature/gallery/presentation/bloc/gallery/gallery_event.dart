part of 'gallery_bloc.dart';

@immutable
sealed class GalleryEvent {}

class GalleryInitialEvent extends GalleryEvent {}

class GallerySearchEvent extends GalleryEvent {
  final String query;

  GallerySearchEvent({required this.query});
}

class GalleryLoadMoreEvent extends GalleryEvent {}
