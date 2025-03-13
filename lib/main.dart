import 'package:bloc_session/1_counter_app_using_provider/counter_app_with_provider.dart';
import 'package:bloc_session/6_form_validation_example/presentation/form_screen.dart';
import 'package:bloc_session/4_theme_example/presentation/theme_app.dart';
import 'package:bloc_session/5_todo_app_example/presentation/todo_app.dart';
import 'package:bloc_session/8_bloc_counter/bloc/counter_observer.dart';
import 'package:bloc_session/8_bloc_counter/presentation/counter_bloc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '0_counter_app_using_setState/counter_app.dart';
import '1_counter_app_using_provider/counter_app_with_provider_and_consumer.dart';
import '3_counter_app_using_bloc_with_no_explicit_state/presentation/counter_app.dart';
import '3_counter_app_using_bloc_with_state/presentation/counter_app.dart';
import '4_theme_example/presentation/theme_app_with_state.dart';
import '7_api_integration_example/presentation/news_feed.dart';

void main() {

    Bloc.observer = const CounterObserver();

  runApp(const
  //CounterAppUsingSetState(),
  //CounterAppUsingProvider(),
  //CounterAppWithProviderAndConsumer()
  //CounterAppUsingBloc()
  //CounterAppUsingBloc__withState()
  //ThemeApp()
  //ThemeAppWithState()
  //TodoApp()
  //FormValidationApp()
  //NewsApp()
  CounterBlocApp(),

  );
}
