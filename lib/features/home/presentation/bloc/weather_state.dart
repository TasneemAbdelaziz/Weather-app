
part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
final class WeatherLoading extends WeatherState {}

final class WeatherFeatched extends WeatherState {
    final WeatherModel weatherModel;
    WeatherFeatched(this.weatherModel);

}
class WeatherHistoryFeatched extends WeatherState {
  final List<WeatherModel> historyList;
   WeatherHistoryFeatched(this.historyList);
}

class WeatherCombinedData extends WeatherState {
  final WeatherModel forecastModel;
  final List<WeatherModel> historyList;

  WeatherCombinedData({
    required this.forecastModel,
    required this.historyList,
  });
}

final class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
