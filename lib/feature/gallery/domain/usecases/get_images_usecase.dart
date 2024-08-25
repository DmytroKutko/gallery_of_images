import 'package:gallery_of_images/core/resources/data_state.dart';
import 'package:gallery_of_images/core/usecase/usecase.dart';
import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';
import 'package:gallery_of_images/feature/gallery/domain/repository/images_repository.dart';

class GetImagesParams {
  final int page;
  final String? q;

  GetImagesParams({required this.page, this.q});
}

class GetImagesUsecase
    extends UseCase<DataState<List<ImageEntity>>, GetImagesParams> {
  final ImagesRepository repository;

  GetImagesUsecase({required this.repository});

  @override
  Future<DataState<List<ImageEntity>>> call({GetImagesParams? params}) {
    return repository.getImages(params!.page, params.q);
  }
}
