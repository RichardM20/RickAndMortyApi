import 'package:demo/src/controllers/character_list_controller.dart';
import 'package:demo/src/controllers/global_controller.dart';
import 'package:demo/src/global_widgets/hover_loading.dart';
import 'package:demo/src/views/character_list/widgets/content_list_data.dart';
import 'package:demo/src/views/character_list/widgets/content_text_top.dart';
import 'package:demo/src/views/character_list/widgets/content_top_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final _instance = Get.put(CharacterListScreenController());
  final _controller = CharacterListScreenController.to;
  @override
  void initState() {
    _controller.fetch(page: GlobalController.to.page.value);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CharacterListScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: _controller.loading.value ? const Hover() : _body(),
      ),
    );
  }

  Widget _body() {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          ContentTopWidget(
            img: _controller.imageNetwork,
          ),
          Column(
            children: [
              SizedBox(height: size.height * .02),
              ContentTextWidget(
                limit: _controller.infoPage.value.pages!,
              ),
              DataListContent(controller: _controller)
            ],
          ),
        ],
      ),
    );
  }
}
