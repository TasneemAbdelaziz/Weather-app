part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}
final class GetWeatherEvent extends WeatherEvent{
  final String city;
  GetWeatherEvent(this.city);
}

final class GetThreeDaysAgoEvent extends WeatherEvent{
  final String city;
  GetThreeDaysAgoEvent(this.city);
}
