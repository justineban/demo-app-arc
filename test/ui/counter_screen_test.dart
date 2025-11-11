import 'package:demo_app_arc/data/repositories/counter_repository.dart';
import 'package:demo_app_arc/data/services/counter_service.dart';
import 'package:demo_app_arc/domain/use_cases/get_counter_use_case.dart';
import 'package:demo_app_arc/domain/use_cases/increment_counter_use_case.dart';
import 'package:demo_app_arc/ui/features/counter/view_model/counter_view_model.dart';
import 'package:demo_app_arc/ui/features/counter/widgets/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget buildTestWidget() {
  final service = InMemoryCounterService(latency: Duration.zero);
  final repository = CounterRepositoryImpl(service: service);
  final getCounter = GetCounterUseCase(repository);
  final incrementCounter = IncrementCounterUseCase(repository);

  return ChangeNotifierProvider(
    create: (_) => CounterViewModel(
      getCounterUseCase: getCounter,
      incrementCounterUseCase: incrementCounter,
    )..load(),
    child: const MaterialApp(home: CounterScreen()),
  );
}

void main() {
  testWidgets('CounterScreen shows initial value and increments', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestWidget());

    // allow initial load future to resolve
    await tester.pump(); // start loading
    await tester.pump(const Duration(milliseconds: 10)); // finish loading

    expect(find.text('Value: 0'), findsOneWidget);

    // increment
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // start loading after tap
    await tester.pump(
      const Duration(milliseconds: 10),
    ); // finish increment future

    expect(find.text('Value: 1'), findsOneWidget);
  });
}
