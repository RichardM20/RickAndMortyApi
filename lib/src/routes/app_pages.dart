import 'package:demo/src/views/character_list/character_list.dart';
import 'package:demo/src/views/detail_character/detail_screen.dart';
import 'package:demo/src/views/home/pages.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => PagesNavigation(),
    ),
    GetPage(
      name: Routes.CHARACTERSLISTCREEN,
      page: () => CharacterListScreen(),
    ),
    GetPage(
      name: Routes.CHARACTERDETAILCREEN,
      page: () => const CharacterDetailScreen(),
    ),
  ];
}
