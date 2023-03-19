// ignore_for_file: unrelated_type_equality_checks

import 'package:demo/src/global_widgets/img_content_widget.dart';
import 'package:demo/src/models/character_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailItemContent extends StatelessWidget {
  const CharacterDetailItemContent({
    super.key,
    required this.characterDetail,
    required this.id,
    required this.itemId,
  });
  final Result characterDetail;
  final RxInt id;
  final RxInt itemId;
  @override
  Widget build(BuildContext context) {
    final mediaquerySize = MediaQuery.of(context).size;
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: mediaquerySize.width,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 9.0,
              color: id.value == itemId.value
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeImageContent(
              image: characterDetail.image!,
            ),
            const SizedBox(width: 20),
            _generalInfoContent(context)
          ],
        ),
      ),
    );
  }

  Widget _generalInfoContent(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                characterDetail.name == null
                    ? "unnamed"
                    : characterDetail.name!,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (id.value == itemId.value)
                Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                "Location: ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Flexible(
                child: Text(
                  characterDetail.location!.name == null
                      ? "unnamed"
                      : characterDetail.location!.name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Created: ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                characterDetail.created == null
                    ? "not found"
                    : "${characterDetail.created!.toLocal().day}/${characterDetail.created!.toLocal().month}/${characterDetail.created!.toLocal().year}",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
