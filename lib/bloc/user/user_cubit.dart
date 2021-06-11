import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      User newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addProfession(String profession) {
    final currentState = state;
    if (currentState is UserActive) {
      final professions = [...currentState.user.professions, profession];
      User newUser = currentState.user.copyWith(professions: professions);
      emit(UserActive(newUser));
    }
  }

  void removeUser() {
    emit(UserInitial());
  }
}
