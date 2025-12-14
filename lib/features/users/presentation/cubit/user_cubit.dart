import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_state.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserCubit(this.getUsersUseCase) : super(UserInitial());

  Future<void> fetchUsers() async {
    emit(UserLoading());

    try {
      final users = await getUsersUseCase.execute();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
