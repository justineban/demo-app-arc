import 'package:flutter/foundation.dart';

import '../../../../domain/models/counter.dart';
import '../../../../domain/use_cases/get_counter_use_case.dart';
import '../../../../domain/use_cases/increment_counter_use_case.dart';

/// ViewModel (MVVM) holds UI state and exposes commands.
class CounterViewModel extends ChangeNotifier {
  final GetCounterUseCase _getCounter;
  final IncrementCounterUseCase _incrementCounter;

  Counter? _counter;
  bool _loading = false;
  String? _error;

  CounterViewModel({
    required GetCounterUseCase getCounterUseCase,
    required IncrementCounterUseCase incrementCounterUseCase,
  }) : _getCounter = getCounterUseCase,
       _incrementCounter = incrementCounterUseCase;

  Counter? get counter => _counter;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> load() async {
    _setLoading(true);
    _error = null;
    try {
      _counter = await _getCounter();
    } catch (e) {
      _error = 'Failed to load counter';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> increment() async {
    _setLoading(true);
    _error = null;
    try {
      _counter = await _incrementCounter();
    } catch (e) {
      _error = 'Failed to increment';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
