import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/presentation/model/dummy_data.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final List<ImageEntity> list = [];

  GalleryBloc() : super(GalleryInitial()) {
    on<GalleryInitialEvent>(galleryInitialEvent);
  }

  FutureOr<void> galleryInitialEvent(
      GalleryInitialEvent event, Emitter<GalleryState> emit) {
    emit(GalleryInitial());
    list.addAll(generateImageEntities());
    emit(GallerySuccess());
  }
}
