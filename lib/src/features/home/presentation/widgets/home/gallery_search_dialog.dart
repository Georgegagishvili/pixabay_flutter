import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/features/exports.dart';

class _GallerySearchDialogState extends State<GallerySearchDialog> {
  late final TextEditingController _controller = TextEditingController(
    text: context.read<GalleryBloc>().state.query,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search'),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Query here...',
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.read<GalleryBloc>().add(
                  GallerySearch(_controller.text),
                );
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}

class GallerySearchDialog extends StatefulWidget {
  const GallerySearchDialog({super.key});

  @override
  State<GallerySearchDialog> createState() => _GallerySearchDialogState();
}
