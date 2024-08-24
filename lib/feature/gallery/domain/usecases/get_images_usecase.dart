import 'package:gallery_of_images/core/usecase/usecase.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';

class GetImagesParams {
  final int page;

  GetImagesParams({required this.page});
}

class GetImagesUsecase extends UseCase<List<ImageEntity>, GetImagesParams> {
  @override
  Future<List<ImageEntity>> call({GetImagesParams? params}) {
    throw UnimplementedError();
  }

}
