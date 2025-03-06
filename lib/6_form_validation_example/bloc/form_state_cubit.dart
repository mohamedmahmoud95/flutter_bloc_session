import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormState());

  void updateEmail(String email) {
    final newState = state.copyWith(email: email);
    emit(newState);
  }

  void updatePassword(String password) {
    final newState = state.copyWith(password: password);
    emit(newState);
  }

  void validateForm() {
    final emailValid = state.email.contains('@');
    final passwordValid = state.password.length >= 6;

    emit(state.copyWith(
      isEmailValid: emailValid,
      isPasswordValid: passwordValid,
    ));
  }
}
