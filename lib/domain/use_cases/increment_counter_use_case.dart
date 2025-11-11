import '../models/counter.dart';
import '../repositories/counter_repository.dart';

/// UseCase: increments the counter via repository.
class IncrementCounterUseCase {
  final CounterRepository _repository;
  IncrementCounterUseCase(this._repository);

  Future<Counter> call() => _repository.increment();
}
