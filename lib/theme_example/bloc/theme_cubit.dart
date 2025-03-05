import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  void toggleTheme() {
    emit(state == _lightTheme ? _darkTheme : _lightTheme);
  }
}