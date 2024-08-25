import 'package:dio/dio.dart';
import 'package:gallery_of_images/feature/gallery/data/remote/rest_client.dart';
import 'package:gallery_of_images/feature/gallery/data/repository/images_repository_impl.dart';
import 'package:gallery_of_images/feature/gallery/domain/repository/images_repository.dart';
import 'package:gallery_of_images/feature/gallery/domain/usecases/get_images_usecase.dart';
import 'package:gallery_of_images/feature/gallery/presentation/bloc/gallery/gallery_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.I;

Future<void> initDependencies() async {
  // Retrofit
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton(Client(sl()));

  // Repository
  sl.registerSingleton<ImagesRepository>(ImagesRepositoryImpl(client: sl()));

  // Usecase
  sl.registerSingleton<GetImagesUsecase>(GetImagesUsecase(repository: sl()));

  //Bloc
  sl.registerSingleton(GalleryBloc(getImagesUsecase: sl()));
}
