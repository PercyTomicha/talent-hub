import '../repositories/prefs_repository.dart';
import '../../../../core/database/app_database.dart';

class GetSavedUsersUseCase {
  final PrefsRepository repository;
  GetSavedUsersUseCase(this.repository);
  Future<List<UserPref>> execute() => repository.getSavedUsers();
}

class SaveUserUseCase {
  final PrefsRepository repository;
  SaveUserUseCase(this.repository);
  Future<void> execute(String name) => repository.saveUser(name);
}

class DeleteUserUseCase {
  final PrefsRepository repository;
  DeleteUserUseCase(this.repository);
  Future<void> execute(int id) => repository.deleteUser(id);
}
