import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class GalleryDrawer extends StatelessWidget {
  const GalleryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: context.theme.surfaceVariant,
              ),
              child: const Text(
                'Settings',
                style: AppTextStyles.eighteenW700,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Switch Theme',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Find Images',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.search),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Refresh Page',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.refresh),
            onTap: () {
              context.read<GalleryBloc>().add(GalleryRefreshed());
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text(
              'Logout',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
