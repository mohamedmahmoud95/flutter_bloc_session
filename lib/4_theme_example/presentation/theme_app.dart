import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_cubit_with_no_state.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubitWithNoExplicitState(),
      child: BlocBuilder<ThemeCubitWithNoExplicitState, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
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
    final themeCubit = context.read<ThemeCubitWithNoExplicitState>();

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