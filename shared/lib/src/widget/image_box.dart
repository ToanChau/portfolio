import 'package:flutter/material.dart';
import 'package:resource/resource.dart';

class ImageBox extends StatelessWidget {
  final AssetGenImage image;
  final Size? size;
  final BoxConstraints? constraints;
  final BorderRadius? radius;
  final BoxFit fit;

  const ImageBox({
    super.key,
    this.size,
    required this.image,
    this.constraints,
    this.radius,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(20.0),
      child: Container(
        width: size?.width,
        height: size?.height,
        constraints: constraints,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (size != null &&
                    size!.width != double.infinity &&
                    size!.height != double.infinity)
                ? ResizeImage(
                    image.provider(),
                    width: size!.width.toInt(),
                    height: size!.height.toInt(),
                  )
                : image.provider(),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
