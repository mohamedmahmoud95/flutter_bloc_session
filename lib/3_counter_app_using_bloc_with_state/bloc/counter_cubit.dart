import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubitWithState extends Cubit<CounterState> {
  CounterCubitWithState() : super(CounterState(0));

  void increment() => emit(CounterState(state.count + 1));
  void decrement() => emit(CounterState(state.count - 1));
}