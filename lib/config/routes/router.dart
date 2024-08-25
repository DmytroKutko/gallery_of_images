import 'package:gallery_of_images/feature/gallery/presentation/pages/gallery_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: "/gallery",
  routes: [
    GoRoute(
      path: "/gallery",
      builder: (context, state) => const GalleryPage(),
    ),
  ],
);
