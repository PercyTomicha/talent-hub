import '../../../../core/database/app_database.dart';

abstract class PreferenceState {}

class PreferenceInitial extends PreferenceState {}

class PreferenceLoading extends PreferenceState {}

class PreferenceSuccess extends PreferenceState {
  final List<UserPref> savedUsers;
  PreferenceSuccess(this.savedUsers);
}

class PreferenceError extends PreferenceState {
  final String message;
  PreferenceError(this.message);
}
