import 'package:bloc_session/1_counter_app_using_provider/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';


class CounterAppUsingProvider extends StatelessWidget {
  const CounterAppUsingProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter with Provider')),
      body: Center(
        child: Text(
          'Count: ${counterProvider.count}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PlusButton(),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterProvider.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}