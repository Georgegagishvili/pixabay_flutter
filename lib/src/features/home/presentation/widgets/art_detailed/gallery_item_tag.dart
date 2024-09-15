import 'package:flutter/material.dart';
import 'package:mvvm/src/util/exports.dart';

class GalleryItemTag extends StatelessWidget {
  const GalleryItemTag({
    required this.tag,
    super.key,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tag),
      backgroundColor: context.theme.surfaceVariant,
    );
  }
}
