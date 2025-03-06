import 'package:bloc_session/3_counter_app_using_bloc_with_state/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../3_counter_app_using_bloc_with_no_explicit_state/bloc/counter_cubit.dart';
import '../bloc/counter_state.dart';


class CounterAppUsingBloc__withState extends StatelessWidget {
  const CounterAppUsingBloc__withState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubitWithState(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubitWithState>();

    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: BlocBuilder<CounterCubitWithState, CounterState>(
          builder: (context, state) {
            return Text(
              'Count: ${state.count}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),

        /*
        BlocBuilder listens to state changes in CounterCubit and rebuilds the widget.
        you may also use:
        Text(
          'Count: ${context.watch<CounterCubit>().state}',
          style: TextStyle(fontSize: 24),
        ),
         */
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterCubit.increment(),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => counterCubit.decrement(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}