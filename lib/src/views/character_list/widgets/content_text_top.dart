import 'package:demo/src/views/character_list/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class ContentTextWidget extends StatelessWidget {
  const ContentTextWidget({super.key, required this.limit});
  final int limit;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -600 * value),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "The series follows the misadventures of a scientist, Rick Sanchez, and his easily influenced grandson, Morty, who transition between domestic life and space, time, and intergalactic travel.",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Positioned(
                right: 0,
                bottom: 0,
                child: PageIndicatorWidget(limit: limit),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}
