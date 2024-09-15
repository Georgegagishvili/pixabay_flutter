import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class ArtDetailedDescription extends StatelessWidget {
  const ArtDetailedDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ''.loremIpsum,
      style: AppTextStyles.fourteenW400,
    );
  }
}
