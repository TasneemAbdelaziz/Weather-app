
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';

class GetPredictionUseCase{
  final WeatherRepo weatherRepo;

  GetPredictionUseCase(this.weatherRepo);

  Future<int?> call(List<int> features) {
    return weatherRepo.getPrediction(features);
  }
}