import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';

class ArtDetailedPage extends StatelessWidget {
  const ArtDetailedPage({
    required this.art,
    super.key,
  });

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GalleryDetailedAppbar(art: art),
          SliverToBoxAdapter(
            child: Padding(
              padding: defaultAllPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArtDetailedUserInfo(art: art),
                  const SizedBox(height: 16),
                  const ArtDetailedDescription(),
                  const SizedBox(height: 16),
                  ArtDetailedTags(art: art),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
