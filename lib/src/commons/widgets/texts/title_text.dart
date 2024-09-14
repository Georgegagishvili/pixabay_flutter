import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
    required this.text,
    super.key,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.twentyEightW700,
        ),
        Text(
          text,
          style: AppTextStyles.fourteenW400,
        ),
      ],
    );
  }
}
