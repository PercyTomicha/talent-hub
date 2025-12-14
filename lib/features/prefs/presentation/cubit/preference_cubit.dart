import 'package:flutter_bloc/flutter_bloc.dart';
import 'preference_state.dart';
import '../../domain/usecases/prefs_usecases.dart';

class PreferenceCubit extends Cubit<PreferenceState> {
  final GetSavedUsersUseCase getSavedUsersUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final SaveUserUseCase saveUserUseCase;

  PreferenceCubit({
    required this.getSavedUsersUseCase,
    required this.deleteUserUseCase,
    required this.saveUserUseCase,
  }) : super(PreferenceInitial());

  Future<void> loadPrefs() async {
    emit(PreferenceLoading());
    try {
      final users = await getSavedUsersUseCase.execute();
      emit(PreferenceSuccess(users));
    } catch (e) {
      emit(PreferenceError(e.toString()));
    }
  }

  Future<void> removeUser(int id) async {
    try {
      await deleteUserUseCase.execute(id);
      loadPrefs();
    } catch (e) {
      emit(PreferenceError("No se pudo eliminar"));
    }
  }

  Future<void> saveNewUser(String name) async {
    try {
      await saveUserUseCase.execute(name);
      loadPrefs();
    } catch (e) {
      emit(PreferenceError("Error al guardar: $e"));
    }
  }
}
