import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';

class GalleryListLoader extends StatelessWidget {
  const GalleryListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      itemCount: 8,
      padding: defaultAllPadding,
      itemBuilder: (context, index) {
        return const GalleryItem(
          art: null,
        );
      },
    );
  }
}
