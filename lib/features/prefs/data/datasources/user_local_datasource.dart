import '../../../../core/database/app_database.dart';

abstract class UserLocalDataSource {
  Future<List<UserPref>> getSavedUsers();
  Future<int> saveUser(UserPrefsCompanion user);
  Future<int> deleteUser(int id);
  Future<UserPref?> getUserById(int id);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppDatabase db;
  UserLocalDataSourceImpl(this.db);

  @override
  Future<List<UserPref>> getSavedUsers() => db.select(db.userPrefs).get();

  @override
  Future<int> saveUser(UserPrefsCompanion user) =>
      db.into(db.userPrefs).insert(user);

  @override
  Future<int> deleteUser(int id) =>
      (db.delete(db.userPrefs)..where((t) => t.id.equals(id))).go();

  @override
  Future<UserPref?> getUserById(int id) => (db.select(
    db.userPrefs,
  )..where((t) => t.id.equals(id))).getSingleOrNull();
}
