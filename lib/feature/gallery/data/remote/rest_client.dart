import 'package:dio/dio.dart';
import 'package:gallery_of_images/core/constants/constants.dart';
import 'package:gallery_of_images/feature/gallery/data/model/images_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  @GET('/api/')
  Future<HttpResponse<ImagesResponse>> getImages({
    @Query('key') required String apiKey,
    @Query('page') required int page,
    @Query('q') String? q,
    @Query('per_page') int? perPage,
  });
}
