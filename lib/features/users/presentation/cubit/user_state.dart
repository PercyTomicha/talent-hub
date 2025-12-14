import '../../domain/entities/user_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserEntity> users;
  UserSuccess(this.users);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
