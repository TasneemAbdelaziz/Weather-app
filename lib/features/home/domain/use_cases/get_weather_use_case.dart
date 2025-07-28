import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/home/domain/entities/weather_model.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';

class GetWeatherUseCase {
  final WeatherRepo weatherRepo;
  GetWeatherUseCase(this.weatherRepo);

  Future<Either<Failure, WeatherModel>> call(String city) async {
    try {
      final weather = await weatherRepo.getWeather(city);
      return Right(weather);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
