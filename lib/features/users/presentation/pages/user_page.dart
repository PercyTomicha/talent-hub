import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import '../../../../commons/widgets/banner_error.dart';
import '../../../../commons/widgets/banner_loading.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuestros Talentos')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => {context.push('/prefs')},
                child: Text('Talentos Guardados'),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return BannerLoading();
                  } else if (state is UserSuccess) {
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return ListTile(
                          leading: CircleAvatar(child: Text(user.name[0])),
                          title: Text(user.name),
                          onTap: () => context.push('/prefs/$index'),
                        );
                      },
                    );
                  } else {
                    return BannerError();
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserCubit>().fetchUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
