enum Weather {
  sunny,
  rainy,
  cloudy,
  lowPressure,
}

extension WeatherExtension on Weather {
  String get label {
    switch (this) {
      case Weather.sunny:
        return '晴れ';
      case Weather.rainy:
        return '雨';
      case Weather.cloudy:
        return '曇り';
      case Weather.lowPressure:
        return '低気圧';
    }
  }

  static Weather fromString(String value) =>
      Weather.values.firstWhere((e) => e.name == value);

  static Weather fromName(String value) =>
      Weather.values.firstWhere((e) => e.name == value);
}
