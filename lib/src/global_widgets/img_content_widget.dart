import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeImageContent extends StatelessWidget {
  const FadeImageContent({
    super.key,
    required this.image,
    this.fullImage,
  });
  final String image;
  final bool? fullImage;
  @override
  Widget build(BuildContext context) {
    return fullImage == false
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/loading-gif.gif',
              image: image,
              fit: BoxFit.cover,
            ),
          )
        : Stack(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/loading-gif.gif',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                ),
              ),
            ],
          );
  }
}
