import '../../domain/entities/user_entity.dart';
import '../datasources/user_remote_datasource.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<UserEntity>> getRemoteUsers() async {
    try {
      return await remoteDataSource.getUsers();
    } catch (e) {
      throw Exception("Fallo en la conexión: $e");
    }
  }
}
