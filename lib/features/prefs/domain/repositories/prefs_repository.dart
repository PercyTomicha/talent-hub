import '../../../../core/database/app_database.dart';

abstract class PrefsRepository {
  Future<List<UserPref>> getSavedUsers();
  Future<void> saveUser(String customName);
  Future<void> deleteUser(int id);
}
