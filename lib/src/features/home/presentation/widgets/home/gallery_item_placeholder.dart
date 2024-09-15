import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvvm/src/util/exports.dart';

class GalleryItemPlaceholder extends StatelessWidget {
  const GalleryItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: Random().nextInt(200).toDouble() + 100,
      decoration: BoxDecoration(
        color: context.theme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Align(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
