import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? image;
  final double radius;
  final String url;
  const Avatar({super.key, this.image, required this.radius, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2*radius,
      width: 2*radius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: image!= null
          ? DecorationImage(image: AssetImage(image.toString()))
          : DecorationImage(image: NetworkImage(url))
      )
    );
  }
}