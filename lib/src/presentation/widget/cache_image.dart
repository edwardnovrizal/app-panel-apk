import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_circle.dart';

class WCacheImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const WCacheImage({super.key, required this.url, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: url,
        placeholder: (context, url) {
          return const Center(
            child: AppLoading(size: 20),
          );
        },
        errorWidget: (context, url, error) {
          log("$error");
          return const Icon(
            Icons.error,
          );
        });
  }
}
