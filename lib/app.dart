import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/api_client.dart';
import 'features/users/presentation/pages/user_page.dart';
import 'features/users/presentation/cubit/user_cubit.dart' show UserCubit;
import 'features/users/domain/usecases/get_users_usecase.dart';
import 'features/users/data/datasources/user_remote_datasource.dart';
import 'features/users/data/repositories/user_repository_impl.dart'
    show UserRepositoryImpl;

class TalentHub extends StatelessWidget {
  const TalentHub({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final dataSource = UserRemoteDataSourceImpl(apiClient);
    final repository = UserRepositoryImpl(dataSource);
    final getUsersUseCase = GetUsersUseCase(repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(getUsersUseCase)..fetchUsers(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserPage(),
      ),
    );
  }
}
