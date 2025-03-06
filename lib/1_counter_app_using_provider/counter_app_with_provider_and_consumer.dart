import 'package:bloc_session/1_counter_app_using_provider/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';


class CounterAppWithProviderAndConsumer extends StatelessWidget {
  const CounterAppWithProviderAndConsumer({super.key});

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
    return Scaffold(
      appBar: AppBar(title: Text('Counter with Provider + Consumer')),
      body: Center(
        // Use Consumer to listen to changes in CounterProvider
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) {
            return Text(
              'Count: ${counterProvider.count}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // the following button is from a separate file, yet it works perfectly
          PlusButton(),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Access CounterProvider and call decrement
              Provider.of<CounterProvider>(context, listen: false).decrement();
              /*
              Why use Provider.of with listen: false:
                  When calling Provider.of<CounterProvider>(context, listen: false),
                  the listen: false parameter ensures that the widget does not rebuild when the state changes.
                  This is useful for callbacks like button presses.
               */
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}