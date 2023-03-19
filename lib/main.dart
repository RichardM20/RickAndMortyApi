import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/services/repository/api_repository.dart';
import 'package:demo/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put<GlobalController>(GlobalController());
  Get.put<Repository>(Repository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      defaultTransition: Transition.fadeIn,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
