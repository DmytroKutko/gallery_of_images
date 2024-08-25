import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';

abstract class ImagesRepository {
  Future<DataState<List<ImageEntity>>> getImages(int page, String? q);
}
