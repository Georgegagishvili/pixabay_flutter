import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({super.key});

  @override
  State<GalleryList> createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<GalleryBloc>().add(GalleryRefreshed());
          },
          child: MasonryGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemCount:
                state.hasReachedMax ? state.arts.length : state.arts.length + 6,
            controller: _scrollController,
            padding: defaultAllPadding,
            itemBuilder: (context, index) {
              return GalleryItem(
                art: state.arts.elementAtOrNull(index),
              );
            },
          ),
        );
      },
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<GalleryBloc>().add(GalleryFetched());
    }
  }
}
