import 'package:flutter/foundation.dart';

import '../../domain/models/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../model/counter_dto.dart';
import '../services/counter_service.dart';

/// Implementation that maps DTOs from the service to domain models.
class CounterRepositoryImpl implements CounterRepository {
  final CounterService _service;

  CounterRepositoryImpl({required CounterService service}) : _service = service;

  @visibleForTesting
  Counter fromDto(CounterDto dto) => Counter(value: dto.value);

  @override
  Future<Counter> getCounter() async => fromDto(await _service.fetch());

  @override
  Future<Counter> increment() async => fromDto(await _service.increment());
}
