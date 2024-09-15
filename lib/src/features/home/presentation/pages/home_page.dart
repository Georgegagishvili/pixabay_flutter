import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Gallery',
      ),
      drawer: const GalleryDrawer(),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          switch (state.status) {
            case GalleryStatus.failure:
              return const Center(child: Text('Failed to fetch gallery'));
            case GalleryStatus.success:
              if (state.arts.isEmpty) {
                return const Center(child: Text('No gallery available'));
              }

              return const GalleryList();
            default:
              return const GalleryListLoader();
          }
        },
      ),
    );
  }
}
