import '../models/counter.dart';
import '../repositories/counter_repository.dart';

/// UseCase: retrieves the current counter from repository.
class GetCounterUseCase {
  final CounterRepository _repository;
  GetCounterUseCase(this._repository);

  Future<Counter> call() => _repository.getCounter();
}
