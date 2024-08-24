import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/feature/gallery/data/remote/rest_client.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/domain/repository/images_repository.dart';

class ImagesRepositoryImpl extends ImagesRepository {
  final Client client;
  final String key = dotenv.env['API_KEY']!;

  ImagesRepositoryImpl({required this.client});

  @override
  Future<DataState<List<ImageEntity>>> getImages(int page) async {
    final data = await client.getImages(apiKey: key, page: page);
    if (data.response.statusCode == HttpStatus.ok) {
      final images = data.data.hits!
          .map((value) => ImageEntity(
                galleryUrl: value.previewUrl ?? "",
                fullScreenUrl: value.largeImageUrl ?? "",
                likesCount: value.likes ?? 0,
                commentsCount: value.comments ?? 0,
              ))
          .toList();
      return DataSuccess(images);
    }
    return DataFailed(
      DioException(
        message: data.response.statusMessage,
        requestOptions: data.response.requestOptions,
      ),
    );
  }

  @override
  Future<DataState<List<ImageEntity>>> getImagesFromSearch(int page, String q) async {
    final data = await client.getImagesFromSearch(apiKey: key, page: page, q: q);
    if (data.response.statusCode == HttpStatus.ok) {
      final images = data.data.hits!
          .map((value) => ImageEntity(
                galleryUrl: value.previewUrl ?? "",
                fullScreenUrl: value.largeImageUrl ?? "",
                likesCount: value.likes ?? 0,
                commentsCount: value.comments ?? 0,
              ))
          .toList();
      return DataSuccess(images);
    }
    return DataFailed(
      DioException(
        message: data.response.statusMessage,
        requestOptions: data.response.requestOptions,
      ),
    );
  }
}
