class CounterDto {
  final int value;
  const CounterDto(this.value);

  factory CounterDto.fromJson(Map<String, dynamic> json) =>
      CounterDto(json['value'] as int);

  Map<String, dynamic> toJson() => {'value': value};
}
