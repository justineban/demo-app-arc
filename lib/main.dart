import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/services/counter_service.dart';
import 'data/repositories/counter_repository.dart';
import 'domain/use_cases/get_counter_use_case.dart';
import 'domain/use_cases/increment_counter_use_case.dart';
import 'ui/features/counter/view_model/counter_view_model.dart';
import 'ui/features/counter/widgets/counter_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple manual dependency graph.
    final service = InMemoryCounterService();
    final repository = CounterRepositoryImpl(service: service);
    final getCounter = GetCounterUseCase(repository);
    final incrementCounter = IncrementCounterUseCase(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterViewModel(
            getCounterUseCase: getCounter,
            incrementCounterUseCase: incrementCounter,
          )..load(),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Arch Counter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
