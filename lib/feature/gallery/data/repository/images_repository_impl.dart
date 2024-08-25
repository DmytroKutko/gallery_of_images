import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gallery_of_images/core/constants/constants.dart';
import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/feature/gallery/data/remote/rest_client.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/domain/repository/images_repository.dart';

class ImagesRepositoryImpl extends ImagesRepository {
  final Client client;

  ImagesRepositoryImpl({required this.client});

  @override
  Future<DataState<List<ImageEntity>>> getImages(int page, String? q) async {
    final data =
        await client.getImages(apiKey: api_key, page: page, q: q, perPage: 20);
    if (data.response.statusCode == HttpStatus.ok) {
      final images = data.data.hits!
          .map((value) => ImageEntity(
                id: value.id!,
                galleryUrl: value.webformatUrl ?? "",
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
