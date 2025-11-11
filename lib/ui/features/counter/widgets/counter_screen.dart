import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/counter_view_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Demo (Clean Arc)')),
      body: Center(
        child: Consumer<CounterViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading && vm.counter == null) {
              return const CircularProgressIndicator();
            }
            if (vm.error != null) {
              return Text(vm.error!, style: const TextStyle(color: Colors.red));
            }
            final value = vm.counter?.value ?? 0;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Value: $value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                if (vm.isLoading) const LinearProgressIndicator(),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: vm.isLoading ? null : () => vm.increment(),
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
