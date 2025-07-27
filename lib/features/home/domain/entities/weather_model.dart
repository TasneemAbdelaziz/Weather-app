class WeatherModel {
  final double temp;
  final double feelsLike;
  final String weatherCondition;
  final String cityName;
  final double windSpeed;
  final double humidity;
  final double uvIndex;
  final List<ForecastDay> forecast;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.weatherCondition,
    required this.cityName,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
    required this.forecast,
  });


  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final hasCurrent = json.containsKey('current');
    final forecastList = json['forecast']['forecastday'] as List;
    final forecast = forecastList.map((e) => ForecastDay.fromJson(e)).toList();

    return WeatherModel(
      temp: hasCurrent ? (json['current']['temp_c'] ?? 0.0).toDouble() : 0.0,
      feelsLike: hasCurrent ? (json['current']['feelslike_c'] ?? 0.0).toDouble() : 0.0,
      weatherCondition: hasCurrent ? json['current']['condition']['text'] ?? '' : '',
      cityName: json['location']['name'] ?? '',
      windSpeed: hasCurrent ? (json['current']['wind_kph'] ?? 0.0).toDouble() : 0.0,
      humidity: hasCurrent ? (json['current']['humidity'] ?? 0.0).toDouble() : 0.0,
      uvIndex: hasCurrent ? (json['current']['uv'] ?? 0.0).toDouble() : 0.0,
      forecast: forecast,
    );
  }

}

class ForecastDay {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;
  final double avghumidity;
  final double maxwind_kph;


  ForecastDay({
    required this.maxwind_kph,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.icon,
    required this.avghumidity
  });

  factory ForecastDay.fromJson(Map<String, dynamic> jsonData) {
    return ForecastDay(
      date: jsonData['date'] ?? '',
      maxwind_kph:(jsonData['day']['maxwind_kph'] ?? 0.0).toDouble(),
      maxTemp: (jsonData['day']['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (jsonData['day']['mintemp_c'] ?? 0.0).toDouble(),
      condition: jsonData['day']['condition']['text'] ?? '',
      icon: jsonData['day']['condition']['icon'] ?? '',
      avghumidity: (jsonData['day']['avghumidity'] ?? 0.0).toDouble(),
    );
  }

}
// class WeatherPrediction {
//   final WeatherModel weather;
//   final int prediction;
//
//   WeatherPrediction(this.weather, this.prediction);
// }