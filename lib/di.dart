import 'package:get_it/get_it.dart';
import 'core/network/api_client.dart';
import 'core/database/app_database.dart';
import 'features/users/presentation/cubit/user_cubit.dart';
import 'features/prefs/domain/usecases/prefs_usecases.dart';
import 'features/users/domain/usecases/get_users_usecase.dart';
import 'features/prefs/presentation/cubit/preference_cubit.dart';
import 'features/users/domain/repositories/user_repository.dart';
import 'features/prefs/domain/repositories/prefs_repository.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'features/prefs/data/datasources/user_local_datasource.dart';
import 'features/users/data/datasources/user_remote_datasource.dart';
import 'features/prefs/data/repositories/prefs_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ApiClient());

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetUsersUseCase(sl()));

  sl.registerFactory(() => UserCubit(sl()));

  final database = AppDatabase();
  sl.registerLazySingleton(() => database);

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PrefsRepository>(() => PrefsRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetSavedUsersUseCase(sl()));
  sl.registerLazySingleton(() => SaveUserUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

  sl.registerFactory(
    () => PreferenceCubit(
      getSavedUsersUseCase: sl(),
      deleteUserUseCase: sl(),
      saveUserUseCase: sl(),
    ),
  );
}
