

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Counter(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            Consumer<Counter>(
              builder: (context, counter, child) => Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    counter.increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}