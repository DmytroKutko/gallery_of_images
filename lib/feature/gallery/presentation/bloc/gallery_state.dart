part of 'gallery_bloc.dart';

@immutable
sealed class GalleryState {}

final class GalleryInitial extends GalleryState {}
final class GalleryLoading extends GalleryState {}
final class GallerySuccess extends GalleryState {}
final class GalleryError extends GalleryState {}
