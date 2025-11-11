import '../models/counter.dart';

/// Boundary used by Domain and UI layers.
abstract class CounterRepository {
  Future<Counter> getCounter();
  Future<Counter> increment();
}
