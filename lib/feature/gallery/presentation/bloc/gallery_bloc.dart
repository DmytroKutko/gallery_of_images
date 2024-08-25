import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/domain/usecases/get_images_usecase.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final List<ImageEntity> list = [];
  final GetImagesUsecase getImagesUsecase;
  int page = 1;

  GalleryBloc({required this.getImagesUsecase}) : super(GalleryInitial()) {
    on<GalleryInitialEvent>(galleryInitialEvent);
  }

  FutureOr<void> galleryInitialEvent(
      GalleryInitialEvent event, Emitter<GalleryState> emit) async {
    emit(GalleryLoading());
    final response =
        await getImagesUsecase(params: GetImagesParams(page: page));

    if (response is DataSuccess) {
      if (response.data!.isNotEmpty) {
        list.addAll(response.data!);
        emit(GallerySuccess());
      } else {
        emit(GalleryError(message: "List is empty"));
      }
    } else {
      emit(GalleryError(
          message: response.exception?.message ?? "Error loading content"));
    }
  }
}
