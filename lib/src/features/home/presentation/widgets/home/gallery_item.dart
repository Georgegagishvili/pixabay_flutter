import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class _GalleryItemState extends State<GalleryItem> {
  bool _animate = false;
  Timer? _delay;

  @override
  void initState() {
    super.initState();
    _randomlyDelayedAnimation();
  }

  @override
  void dispose() {
    _delay?.cancel();
    super.dispose();
  }

  Future<void> _randomlyDelayedAnimation() async {
    if (!mounted) return;
    _delay = await Future.delayed(
      Duration(milliseconds: Random().nextInt(300) + 100),
      () {
        _animate = true;
        if (!mounted) return;
        setState(() {});
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.bottomCenter,
      scale: _animate ? 1 : 0,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: widget.art == null
            ? const GalleryItemPlaceholder()
            : GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  context.push(
                    ArtDetailedPage(art: widget.art!),
                  );
                },
                child: AspectRatio(
                  aspectRatio: widget.art?.imageSize.aspectRatio ?? 1,
                  child: Hero(
                    tag: widget.art!.id,
                    child: Stack(
                      children: [
                        /// we have [widget.art.previewImage] for thumbnail,
                        /// but i won't use it here as it doesn't fit the design
                        DefaultNetworkImage(
                          widget.art?.image ?? '',
                          fit: BoxFit.cover,
                          borderRadius: 8,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              left: 4,
                              right: 4,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  context.theme.background.withOpacity(0.9),
                                  context.theme.background.withOpacity(0),
                                ],
                              ),
                            ),
                            child: DefaultTextStyle(
                              style: AppTextStyles.twelveW400,
                              child: Text(
                                widget.art!.author,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.twelveW400.copyWith(
                                  color: context.theme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class GalleryItem extends StatefulWidget {
  const GalleryItem({
    this.art,
    super.key,
  });

  final Art? art;

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}
