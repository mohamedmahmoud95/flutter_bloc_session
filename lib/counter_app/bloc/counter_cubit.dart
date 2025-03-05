import 'package:flutter_bloc/flutter_bloc.dart';

/// A `Cubit` which manages an `int` as its state.
/// This `Cubit` is responsible for incrementing and decrementing the counter value.

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

