import 'package:bloc_session/4_theme_example/bloc/theme_cubit_with_state.dart';
import 'package:bloc_session/4_theme_example/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_cubit_with_no_state.dart';

class ThemeAppWithState extends StatelessWidget {
  const ThemeAppWithState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: ThemeScreen(),
          );
        },
      ),
    );
  }
}

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Theme Toggler')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => themeCubit.toggleTheme(),
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}