import 'package:weather_app/features/home/domain/entities/weather_model.dart';

abstract class WeatherRepo{
  Future<WeatherModel> getWeather(String city);
  Future<List<WeatherModel>> get3daysAgo(String city);
  Future<int?> getPrediction(List<int> features);

}