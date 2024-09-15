import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class GalleryDetailedAppbar extends StatelessWidget {
  const GalleryDetailedAppbar({
    required this.art,
    super.key,
  });

  final Art art;

  @override
  Widget build(BuildContext context) {
    final artWidth = art.imageSize.width;
    final artHeight = art.imageSize.height;
    final expandedHeight =
        artHeight * MediaQuery.of(context).size.width / artWidth - 30;
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      scrolledUnderElevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: art.id,
          child: Material(
            child: Stack(
              children: [
                DefaultNetworkImage(
                  art.image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 45,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${art.imageType} • ${art.imageSize.width.toInt()} x ${art.imageSize.height.toInt()}',
                            textAlign: TextAlign.left,
                            style: AppTextStyles.twelveW400.copyWith(
                              color: context.theme.inverseSurface,
                            ),
                          ),
                        ),
                        _IconText(
                          icon: Icons.thumb_up_outlined,
                          text: '${art.likes}',
                        ),
                        const SizedBox(width: 4),
                        _IconText(
                          icon: Icons.comment_outlined,
                          text: '${art.commentsAmount}',
                        ),
                        const SizedBox(width: 4),
                        _IconText(
                          icon: Icons.favorite_border_rounded,
                          text: '${art.favorites}',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: context.theme.inverseSurface,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.twelveW400.copyWith(
            color: context.theme.inverseSurface,
          ),
        ),
      ],
    );
  }
}
