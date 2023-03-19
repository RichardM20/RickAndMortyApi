import 'package:demo/src/controllers/character_detail_controller.dart';
import 'package:demo/src/global_widgets/hover_loading.dart';
import 'package:demo/src/views/detail_character/widgets/content_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({super.key});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  final _instance = Get.lazyPut(() => CharacterDetailScreenController());
  final _controller = CharacterDetailScreenController.to;

  @override
  void initState() {
    _controller.fetch();

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CharacterDetailScreenController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: _controller.loading.value == true
            ? const Hover()
            : DetailWidget(controller: _controller),
      ),
    );
  }
}
