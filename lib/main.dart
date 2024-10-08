import 'package:flutter/material.dart';
import 'package:gallery_of_images/config/routes/router.dart';
import 'package:gallery_of_images/config/theme/theme.dart';
import 'package:gallery_of_images/feature/service_locator.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gallery of images',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
