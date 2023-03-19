import 'package:demo/src/controllers/character_detail_controller.dart';
import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/global_widgets/img_content_widget.dart';
import 'package:demo/src/views/detail_character/widgets/content_data_detail.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.controller});
  final CharacterDetailScreenController controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GlobalController.to.exceptionOnDetail.value == true
        ? Center(
            child: Text(
              GlobalController.to.messageEx.value,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : controller.characterModel.value.name == null
            ? const Center(
                child: Text(
                  "You have not selected any character",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : Stack(
                children: [
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0.0, -600 * value),
                        child: Stack(
                          children: [
                            FadeImageContent(
                              image: controller.characterModel.value.image!,
                              fullImage: false,
                            ),
                            Container(
                              width: size.width,
                              color: Colors.black.withOpacity(0.5),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0.0, 600 * value),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.4),
                              CharacterDetailContent(
                                detail: controller.characterModel.value,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
  }
}
