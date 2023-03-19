import 'package:flutter/material.dart';

class ContentTopWidget extends StatelessWidget {
  const ContentTopWidget({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: size.width,
          height: size.height,
          color: Colors.black.withOpacity(0.8),
        )
      ],
    );
  }
}
