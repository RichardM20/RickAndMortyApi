import 'package:demo/src/controllers/character_list_controller.dart';
import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/views/character_list/widgets/content_item_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListContent extends StatelessWidget {
  const DataListContent({super.key, required this.controller});
  final CharacterListScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        tween: Tween(begin: 1.0, end: 0.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0.0, 600 * value),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.characterList.length,
                itemBuilder: (context, index) {
                  return TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(600 * value, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.onTap(newIndex: index.obs);
                            GlobalController.to.characterId.value =
                                controller.characterList[index].id!;
                          },
                          child: CharacterDetailItemContent(
                            id: GlobalController.to.characterId,
                            itemId: controller.characterList[index].id!.obs,
                            characterDetail: controller.characterList[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
