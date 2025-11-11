import 'package:flutter_test/flutter_test.dart';

import 'package:demo_app_arc/data/repositories/counter_repository.dart';
import 'package:demo_app_arc/data/services/counter_service.dart';
import 'package:demo_app_arc/domain/use_cases/get_counter_use_case.dart';
import 'package:demo_app_arc/domain/use_cases/increment_counter_use_case.dart';

void main() {
  test('Use cases call repository and return values', () async {
    final service = InMemoryCounterService(latency: Duration.zero);
    final repo = CounterRepositoryImpl(service: service);

    final getCounter = GetCounterUseCase(repo);
    final increment = IncrementCounterUseCase(repo);

    final c1 = await getCounter();
    expect(c1.value, 0);

    final c2 = await increment();
    expect(c2.value, 1);
  });
}
