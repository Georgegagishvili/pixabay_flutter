import 'package:flutter/material.dart';
import 'package:mvvm/src/features/exports.dart';

class ArtDetailedTags extends StatelessWidget {
  const ArtDetailedTags({
    required this.art,
    super.key,
  });

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: art.tags.map((e) => GalleryItemTag(tag: e)).toList(),
    );
  }
}
