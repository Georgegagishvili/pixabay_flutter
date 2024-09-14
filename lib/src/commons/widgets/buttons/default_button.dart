import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.label,
    this.onTap,
    this.enabled = true,
    this.loading = false,
    super.key,
  });

  final String? label;
  final VoidCallback? onTap;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: enabled && !loading ? onTap : null,
        borderRadius: BorderRadius.circular(4),
        child: Ink(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: context.theme.primary.withOpacity(
              enabled && !loading ? 1 : 0.5,
            ),
          ),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            firstChild: Align(
              child: Text(
                label!,
                textAlign: TextAlign.center,
                style: AppTextStyles.sixteenW500.copyWith(
                  color: context.theme.onPrimary,
                ),
              ),
            ),
            secondChild: Align(
              child: Container(
                height: 23,
                width: 23,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                child: const CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              ),
            ),
            crossFadeState:
                loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          ),
        ),
      ),
    );
  }
}
