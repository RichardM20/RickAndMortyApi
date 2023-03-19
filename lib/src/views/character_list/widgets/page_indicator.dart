import 'package:demo/src/controllers/character_list_controller.dart';
import 'package:demo/src/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.limit});
  final int limit;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (GlobalController.to.page.value > 1) {
                GlobalController.to.page.value--;

                CharacterListScreenController.to.fetch(
                  page: GlobalController.to.page.value,
                );
              }
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: GlobalController.to.page.value == 1
                  ? Colors.grey
                  : Colors.blue,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "${GlobalController.to.page.value}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (GlobalController.to.page.value < limit) {
                GlobalController.to.page.value++;
              }
              CharacterListScreenController.to.fetch(
                page: GlobalController.to.page.value,
              );
            },
            child: Icon(
              Icons.keyboard_arrow_right,
              color: GlobalController.to.page.value < limit
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
