import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/controllers/home_controller.dart';
import 'package:demo/src/views/home/widgets/bottom_navbar.dart';
import 'package:demo/src/views/home/widgets/unselected_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesNavigation extends StatelessWidget {
  PagesNavigation({super.key});

  final _controller = HomeController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions: [
          SizedBox(
            child: Obx(() => (GlobalController.to.characterId.value >= 1)
                ? const UnselectedItemWidget()
                : const SizedBox()),
          )
        ],
        title: const Text(
          "Rick and Morty Characters",
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      body: Obx(
        () => Center(
          child: _controller.pages[_controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _controller.currentIndex,
        items: _controller.itemsBNV,
      ),
    );
  }
}
