

import 'package:weather_app/features/home/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/domain/entities/weather_model.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepoImpl({required this.remoteDataSource});

  @override
  Future<WeatherModel> getWeather(String city) async {
    try {
      final model = await remoteDataSource.getWeather(city);
      return model;
    } catch (e) {
      throw Exception('Failed to get weather data: $e');
    }
  }

  Future<List<WeatherModel>> get3daysAgo(String city) async {
    try {
      final ListModel = await remoteDataSource.get3daysAgo(city);
      return ListModel;
    } catch (e) {
      throw Exception('Failed to get list weather data: $e');
    }
  }

  @override
  Future<int?> getPrediction(List<int> features) {
    return remoteDataSource.getPrediction(features);
  }
}