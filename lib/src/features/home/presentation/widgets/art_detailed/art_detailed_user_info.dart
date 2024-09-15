import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class ArtDetailedUserInfo extends StatelessWidget {
  const ArtDetailedUserInfo({
    required this.art,
    super.key,
  });

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultNetworkImage(
          art.authorImage,
          alignment: Alignment.centerLeft,
          borderRadius: 100,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              art.author,
              style: AppTextStyles.sixteenW700.copyWith(
                color: context.theme.surfaceTint,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.download,
              color: context.theme.surfaceTint,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              art.downloads.toString(),
            )
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Artist',
          style: AppTextStyles.fourteenW400,
        ),
      ],
    );
  }
}
