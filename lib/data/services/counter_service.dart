import 'dart:async';

import '../model/counter_dto.dart';

/// Service layer responsible for talking to external sources (APIs, DB, etc.)
abstract class CounterService {
  Future<CounterDto> fetch();
  Future<CounterDto> increment();
}

/// Simple in-memory fake service that simulates latency.
class InMemoryCounterService implements CounterService {
  int _value = 0;

  final Duration latency;
  InMemoryCounterService({this.latency = const Duration(milliseconds: 300)});

  @override
  Future<CounterDto> fetch() async {
    await Future<void>.delayed(latency);
    return CounterDto(_value);
  }

  @override
  Future<CounterDto> increment() async {
    await Future<void>.delayed(latency);
    _value += 1;
    return CounterDto(_value);
  }
}
