import 'package:flutter_test/flutter_test.dart';

import 'package:demo_app_arc/data/repositories/counter_repository.dart';
import 'package:demo_app_arc/data/services/counter_service.dart';

void main() {
  group('CounterRepositoryImpl', () {
    test('maps DTO to domain model', () async {
      final service = InMemoryCounterService(latency: Duration.zero);
      final repo = CounterRepositoryImpl(service: service);

      final counter = await repo.getCounter();
      expect(counter.value, 0);

      final next = await repo.increment();
      expect(next.value, 1);
    });
  });
}
