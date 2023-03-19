import 'package:demo/src/models/character_detail_model.dart';
import 'package:demo/src/views/detail_character/widgets/characteristics_content.dart';
import 'package:flutter/material.dart';

class CharacterDetailContent extends StatelessWidget {
  const CharacterDetailContent({super.key, required this.detail});
  final CharacterDetail detail;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const HideWidget(),
            CharacteristicsWidget(
              info: detail.name!,
              characteristic: "Name",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.location!.name!,
              characteristic: "Location",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.gender!,
              characteristic: "Gender",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.origin!.name!,
              characteristic: "Origin",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.species!,
              characteristic: "Species",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.type!.isEmpty ? "Empty" : detail.type!,
              characteristic: "Type",
            ),
            const Divider(),
            CharacteristicsWidget(
              info: detail.status!,
              characteristic: "Status",
            ),
          ],
        ),
      ),
    );
  }
}
