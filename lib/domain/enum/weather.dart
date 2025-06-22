enum Weather {
  sunny('晴れ'),
  rainy('雨'),
  cloudy('曇り'),
  lowPressure('低気圧');

  final String label;

  const Weather(this.label);

  static Weather fromString(String value) =>
      Weather.values.firstWhere((e) => e.name == value);

  static Weather fromName(String value) =>
      Weather.values.firstWhere((e) => e.name == value);
}
