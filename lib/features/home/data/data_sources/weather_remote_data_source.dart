import 'dart:convert';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:weather_app/core/api/api_constant.dart';
import 'package:weather_app/core/secrets/app_secrets.dart';
import 'package:http/http.dart'as http;
import 'package:weather_app/features/home/domain/entities/weather_model.dart';


class WeatherRemoteDataSource{
  final http.Client client;
  WeatherRemoteDataSource(this.client);

  Future<WeatherModel> getWeather(String city) async {
    final url = Uri.parse(
        "${ApiConstants.baseUrl}/forecast.json?key=${AppSecrets.ApiKey}&q=$city&days=7&aqi=no&alerts=no");
    final res = await client.get(url);

    if (res.statusCode != 200) {
      throw Exception("Failed to fetch data: ${res.statusCode}");
    }

    final data = jsonDecode(res.body);

    if (data.containsKey('error')) {
      throw Exception(data['error']['message'] ?? 'Invalid location');
    }

    // Return the complete WeatherModel, not just forecast days
    return WeatherModel.fromJson(data);
  }


  Future<List<WeatherModel>> get3daysAgo(String city) async {
    final today = DateTime.now();
    List<WeatherModel> weatherList = [];
  for(int i =1; i<=3;i++){
      final date = today.subtract(Duration(days: i));
      final formattedDate = "${date.year}-${date.month.toString().padLeft(2,"0")}-${date.day.toString().padLeft(2,"0")}";
      final url = Uri.parse(
          "${ApiConstants.baseUrl}/history.json?key=${AppSecrets.ApiKey}&q=$city&dt=$formattedDate");
      final res = await client.get(url);
      if (res.statusCode != 200) {
        throw Exception("Failed to fetch data: ${res.statusCode}");
      }
      final data = jsonDecode(res.body);
      if (data.containsKey('error')) {
        throw Exception(data['error']['message'] ?? 'Invalid location');
      }
      final weatherModel = WeatherModel.fromJson(data);
      weatherList.add(weatherModel);
    }
    return  weatherList;
  }




  }