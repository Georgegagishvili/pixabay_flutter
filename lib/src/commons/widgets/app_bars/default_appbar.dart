import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.title,
    this.color,
    super.key,
  });

  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: AppTextStyles.eighteenW700,
      ),
      backgroundColor: color,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
