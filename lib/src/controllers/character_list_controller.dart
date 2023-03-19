import 'package:demo/src/services/repository/api_repository.dart';
import 'package:demo/src/models/character_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListScreenController extends GetxController {
  static CharacterListScreenController get to =>
      Get.find<CharacterListScreenController>();

  final _characterListModel = RxList<Characterlist>([]);
  final characterList = RxList<Result>([]);
  final infoPage = Info().obs;
  final String imageNetwork =
      "https://assets.stickpng.com/images/58f37747a4fa116215a92414.png";

  RxInt index = 0.obs;
  RxBool loading = true.obs;
  @override
  void onClose() {
    CharacterListScreenController().dispose();
    super.onClose();
  }

  void fetch({required int page}) async {
    loading.value = true;

    try {
      _characterListModel.value = await Repository.to.getAllCharacters(
        page: page,
      );
      for (var element in _characterListModel) {
        characterList.value = element.results!;
      }
      for (var element in _characterListModel) {
        infoPage.value = element.info!;
      }
      infoPage.refresh();
      characterList.refresh();
      loading.value = false;
    } catch (e) {
      loading.value = false;
      debugPrint("$e");
    }
  }

  void onTap({required RxInt newIndex}) {
    index.value = newIndex.value;
  }
}
