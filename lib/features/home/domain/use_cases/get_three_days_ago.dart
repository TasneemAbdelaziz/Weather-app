
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/home/domain/entities/weather_model.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';

class GetThreeDaysAgoUseCase{
  final WeatherRepo weatherRepo;
  GetThreeDaysAgoUseCase(this.weatherRepo);

  Future <Either<Failure, List<WeatherModel>>> call(String city) async {
    try {
      final weather = await weatherRepo.get3daysAgo(city);
      return Right(weather);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
