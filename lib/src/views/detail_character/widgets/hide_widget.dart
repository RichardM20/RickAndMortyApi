import 'package:demo/src/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HideWidget extends StatelessWidget {
  const HideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () =>
            GlobalController.to.hide.value = !GlobalController.to.hide.value,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                GlobalController.to.hide.value == true
                    ? "Show more"
                    : "Show less",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Icon(
                GlobalController.to.hide.value == true
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
