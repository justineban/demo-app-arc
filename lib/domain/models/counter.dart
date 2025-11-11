/// Domain model representing the current counter value.
class Counter {
  final int value;
  const Counter({required this.value});

  Counter copyWith({int? value}) => Counter(value: value ?? this.value);
}
