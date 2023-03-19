import 'package:demo/src/views/character_list/character_list.dart';
import 'package:demo/src/views/detail_character/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController {
  final itemsBNV = [
    {
      'iconScreen': Icons.home_outlined,
      'nameScreen': "List",
    },
    {
      'iconScreen': Icons.person_2_outlined,
      'nameScreen': "Detail",
    }
  ];
  final List<Widget> pages = [
    const CharacterListScreen(),
    const CharacterDetailScreen(),
  ];
  final RxInt currentIndex = 0.obs;
}
