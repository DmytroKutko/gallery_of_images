import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/domain/usecases/get_images_usecase.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetImagesUsecase getImagesUsecase;
  int page = 1;
  String query = "";
  final List<ImageEntity> images = [];

  GalleryBloc({required this.getImagesUsecase}) : super(GalleryInitial()) {
    on<GalleryInitialEvent>(galleryInitialEvent);
    on<GalleryLoadMoreEvent>(galleryLoadMoreEvent);
    on<GallerySearchEvent>(gallerySearchEvent);
  }

  Future<void> galleryInitialEvent(
      GalleryInitialEvent event, Emitter<GalleryState> emit) async {
    page = 1;
    images.clear();
    emit(GalleryLoading());
    final response =
        await getImagesUsecase(params: GetImagesParams(page: page));

    if (response is DataSuccess) {
      if (response.data!.isNotEmpty) {
        images.addAll(response.data!);
        emit(GallerySuccess());
      } else {
        emit(GalleryError(message: "List is empty"));
      }
    } else {
      emit(GalleryError(
          message: response.exception?.message ?? "Error loading content"));
    }
  }

  Future<void> galleryLoadMoreEvent(
      GalleryLoadMoreEvent event, Emitter<GalleryState> emit) async {
    final nextPage = page + 1;
    final response = await getImagesUsecase(
        params: GetImagesParams(page: nextPage, q: query));

    if (response is DataSuccess) {
      page = nextPage;
      if (response.data!.isNotEmpty) {
        images.addAll(response.data!);
        emit(GalleryLoadMoreSuccessState());
      }
    } else {
      emit(
        GalleryError(
          message: response.exception?.message ?? "Error loading more content",
        ),
      );
    }
  }

  FutureOr<void> gallerySearchEvent(
      GallerySearchEvent event, Emitter<GalleryState> emit) async {
    page = 1;
    images.clear();
    query = event.query;
    emit(GalleryLoading());

    final response =
        await getImagesUsecase(params: GetImagesParams(page: page, q: query));

    if (response is DataSuccess) {
      if (response.data!.isNotEmpty) {
        images.addAll(response.data!);
        emit(GallerySuccess());
      } else {
        emit(GalleryError(message: "No more data available"));
      }
    } else {
      emit(
        GalleryError(
          message: response.exception?.message ?? "Error loading more content",
        ),
      );
    }
  }
}
