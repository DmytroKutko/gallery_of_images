part of 'gallery_bloc.dart';

@immutable
sealed class GalleryState {}

sealed class GalleryListener extends GalleryState {}

final class GalleryInitial extends GalleryState {}

final class GalleryLoading extends GalleryState {}

final class GallerySuccess extends GalleryState {}

final class GalleryError extends GalleryState {
  final String message;

  GalleryError({required this.message});
}

final class GalleryLoadMoreSuccessState extends GalleryListener {}
