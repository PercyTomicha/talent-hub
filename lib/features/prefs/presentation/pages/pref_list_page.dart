import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/preference_cubit.dart';
import '../cubit/preference_state.dart';
import '../../../../commons/widgets/tile_user.dart';
import '../../../../commons/widgets/banner_error.dart';
import '../../../../commons/widgets/banner_loading.dart';

class PrefsListPage extends StatelessWidget {
  const PrefsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Talentos Guardados')),
      body: BlocBuilder<PreferenceCubit, PreferenceState>(
        builder: (context, state) {
          if (state is PreferenceLoading) return const BannerLoading();

          if (state is PreferenceSuccess) {
            if (state.savedUsers.isEmpty) {
              return const Center(
                child: Text('No tienes talentos guardados aún.'),
              );
            }
            return ListView.builder(
              itemCount: state.savedUsers.length,
              itemBuilder: (context, index) {
                final user = state.savedUsers[index];
                return TileUser(
                  name: user.customName,
                  onTap: () => context.push('/prefs/${user.id}'),
                  trailing: TextButton(
                    onPressed: () {
                      context.read<PreferenceCubit>().removeUser(user.id);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }

          if (state is PreferenceError) return const BannerError();

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/prefs/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
