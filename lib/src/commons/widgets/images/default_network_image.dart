import 'package:flutter/material.dart';
import 'package:mvvm/src/util/exports.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
    this.url, {
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.borderRadius,
    super.key,
  });

  final String url;
  final BoxFit fit;
  final Alignment alignment;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.theme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: Image.network(
          url,
          width: width,
          height: height,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: context.theme.onSurfaceVariant,
                ),
                child: Align(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
