import 'package:cached_network_image/cached_network_image.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String placeholder;

  const CustomImageWidget({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final placeholderImage = placeholder.isNotEmpty ? placeholder : Images.bannerPlaceholder;

    return CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        fit: fit,
        );
  }
}
