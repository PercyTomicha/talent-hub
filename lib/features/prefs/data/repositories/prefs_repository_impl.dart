import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/repositories/prefs_repository.dart';
import '../datasources/user_local_datasource.dart';

class PrefsRepositoryImpl implements PrefsRepository {
  final UserLocalDataSource localDataSource;
  PrefsRepositoryImpl(this.localDataSource);

  @override
  Future<List<UserPref>> getSavedUsers() => localDataSource.getSavedUsers();

  @override
  Future<void> saveUser(String customName) {
    return localDataSource.saveUser(
      UserPrefsCompanion(customName: Value(customName)),
    );
  }

  @override
  Future<void> deleteUser(int id) => localDataSource.deleteUser(id);
}
