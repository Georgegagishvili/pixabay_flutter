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
            child: BlocBuilder<LoginCubit, ApiResource<String>>(
              builder: (context, state) {
                if (state.data == null) {
                  return const SizedBox();
                }

                final user = User.fromJson(state.data!.parseJWT!);

                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: context.theme.surfaceVariant,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultNetworkImage(
                        'https://i.imgur.com/ONsT7xf.png',
                        width: 50,
                        height: 50,
                        borderRadius: 100,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.fullName,
                        style: AppTextStyles.sixteenW700.copyWith(
                          color: context.theme.primary,
                        ),
                      ),
                      Text(
                        user.email,
                        style: AppTextStyles.fourteenW400,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              return ListTile(
                title: const Text(
                  'Switch theme',
                  style: AppTextStyles.fourteenW400,
                ),
                leading: Builder(
                  builder: (context) {
                    if (state == ThemeMode.dark) {
                      return const Icon(Icons.light_mode);
                    } else {
                      return const Icon(Icons.dark_mode);
                    }
                  },
                ),
                onTap: () {
                  context.read<ThemeCubit>().switchTheme();
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          ListTile(
            title: const Text(
              'Find images',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.search),
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) {
                  return const GallerySearchDialog();
                },
              );
            },
          ),
          ListTile(
            title: const Text(
              'Refresh page',
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
              'Log out',
              style: AppTextStyles.fourteenW400,
            ),
            leading: const Icon(Icons.logout),
            onTap: () {
              context.read<LoginCubit>().logout();
              context.pushAndRemoveUntil(const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
