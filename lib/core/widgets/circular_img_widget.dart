import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularImgWidget extends StatelessWidget {
  final String? imageUrl;
  final String defaultImageUrl = 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80';
  final double radius;

  // this.imageUrl = defaultImgUrl, this.radius = 50.0
  CircularImgWidget({
    this.imageUrl = null,
    this.radius = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(fit: BoxFit.cover, height: radius, width: radius, imageUrl: defaultImageUrl),
      );
    }
    if (imageUrl!.contains('http'))
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(fit: BoxFit.cover, height: radius, width: radius, imageUrl: imageUrl!),
      );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.file(File(imageUrl!), fit: BoxFit.cover, height: radius, width: radius),
    );
  }
}
