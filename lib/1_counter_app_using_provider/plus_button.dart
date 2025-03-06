import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        // Access CounterProvider and call increment
        Provider.of<CounterProvider>(context, listen: false).increment();
      },
      child: Icon(Icons.add),
    );
  }
}
