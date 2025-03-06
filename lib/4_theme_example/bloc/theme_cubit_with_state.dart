import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(_lightTheme));

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  void toggleTheme() {
    emit(ThemeState(state.themeData == _lightTheme ? _darkTheme : _lightTheme));
  }
}