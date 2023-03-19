import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/services/repository/api_repository.dart';
import 'package:demo/src/models/character_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailScreenController extends GetxController {
  static CharacterDetailScreenController get to =>
      Get.find<CharacterDetailScreenController>();
  RxBool loading = true.obs;
  final characterModel = CharacterDetail().obs;

  void fetch() async {
    loading.value = true;
    try {
      characterModel.value = await Repository.to
          .getCharacterDetail(id: GlobalController.to.characterId.value);
      loading.value = false;
    } catch (e) {
      debugPrint("$e");
      loading.value = false;
    }
  }
}
