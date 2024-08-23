import 'dart:math';

import 'package:gallery_of_images/feature/gallery/domain/entity/image_entity.dart';

List<String> get imageUrls => [
      'https://cdn.pixabay.com/photo/2023/09/04/17/48/flamingos-8233303_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/12/04/18/31/chrysanthemum-8430098_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/03/07/16/44/stork-8618904_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/03/19/05/31/flower-7861942_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/23/20/32/summer-8848728_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/05/08/09/02/spoonbill-8747794_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/08/08/17/13/salt-8955103_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/07/13/22/31/road-8893160_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/09/21/01/20/sugar-blader-8265868_1280.jpg',
      'https://cdn.pixabay.com/photo/2022/10/24/12/20/mountains-7543273_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/06/07/12/47/bird-8047149_1280.jpg',
      'https://cdn.pixabay.com/photo/2021/07/15/05/05/hands-6467490_1280.png',
      'https://cdn.pixabay.com/photo/2024/08/01/08/17/dahlia-8936439_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/07/11/14/32/orange-8888447_1280.png',
      'https://cdn.pixabay.com/photo/2022/04/02/14/40/hearts-7107142_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/08/15/11/47/flowers-8970867_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/06/29/17/57/nature-8096837_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/08/07/19/47/water-lily-8175845_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/08/05/08/15/ship-8170663_1280.jpg',
    ];

List<ImageEntity> generateImageEntities() {
  final random = Random();

  return imageUrls.map((url) {
    return ImageEntity(
      galleryUrl: url,
      fullScreenUrl: url,
      likesCount: random.nextInt(100),
      commentsCount: random.nextInt(20),
    );
  }).toList();
}
