import 'package:get_it/get_it.dart';
import 'core/network/api_client.dart';
import 'features/users/presentation/cubit/user_cubit.dart';
import 'features/users/domain/usecases/get_users_usecase.dart';
import 'features/users/domain/repositories/user_repository.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'features/users/data/datasources/user_remote_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ApiClient());

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetUsersUseCase(sl()));

  sl.registerFactory(() => UserCubit(sl()));
}
