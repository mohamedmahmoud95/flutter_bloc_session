import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_cubit.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        // Creating and providing the CounterCubit to the widget tree.
      create: (context) => CounterCubit(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the CounterCubit instance.
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        // BlocBuilder listens to state changes in CounterCubit and rebuilds the widget.
      child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              'Count: $state',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
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