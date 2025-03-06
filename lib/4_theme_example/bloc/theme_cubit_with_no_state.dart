import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubitWithNoExplicitState extends Cubit<ThemeData> {
  ThemeCubitWithNoExplicitState() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  void toggleTheme() {
    emit(state == _lightTheme ? _darkTheme : _lightTheme);
  }
}