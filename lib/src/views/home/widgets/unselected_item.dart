import 'package:demo/src/controllers/global_controller.dart';
import 'package:flutter/material.dart';

class UnselectedItemWidget extends StatelessWidget {
  const UnselectedItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GlobalController.to.characterId.value = 0;
      },
      child: const Text("Unselect"),
    );
  }
}
