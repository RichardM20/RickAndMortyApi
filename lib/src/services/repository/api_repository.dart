import 'dart:convert';

import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/models/character_detail_model.dart';
import 'package:demo/src/models/character_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Repository extends GetxController {
  static Repository get to => Get.find<Repository>();
  final String _api = "https://rickandmortyapi.com/api/character/";

  Future<List<Characterlist>> getAllCharacters({required int page}) async {
    List<Characterlist> characterList = [];
    try {
      Uri uri = Uri.parse("$_api?page=$page");
      final response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsedData = Characterlist.fromJson(jsonDecode(response.body));
        characterList = [parsedData];
      } else {
        characterList = [];
      }
    } catch (e) {
      debugPrint("exception $e");
    }

    return characterList;
  }

  Future<CharacterDetail> getCharacterDetail({required int id}) async {
    CharacterDetail? characterDetail;
    try {
      Uri uri = Uri.parse("$_api/$id");
      final response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        characterDetail = CharacterDetail.fromJson(jsonDecode(response.body));
        GlobalController.to.exceptionOnDetail.value = false;
      } else {
        characterDetail = characterDetail;
      }
    } catch (e) {
      debugPrint("exception $e");
    }

    return characterDetail!;
  }
}
