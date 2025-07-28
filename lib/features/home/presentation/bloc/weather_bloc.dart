// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:weather_app/core/error/failure.dart';
// import 'package:weather_app/features/home/domain/entities/weather_model.dart';
// import 'package:weather_app/features/home/domain/use_cases/get_three_days_ago.dart';
// import 'package:weather_app/features/home/domain/use_cases/get_weather_use_case.dart';
// // import 'package:weather_app/features/home/data/models/weather_model.dart' as data;
//
// part 'weather_event.dart';
// part 'weather_state.dart';
//
// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final GetWeatherUseCase getWeatherUseCase;
//   final GetThreeDaysAgoUseCase getThreeDaysAgoUseCase;
//   WeatherModel? _forecastModel;
//   List<WeatherModel> _historyList = [];
//
//   WeatherBloc({required this.getWeatherUseCase,required this.getThreeDaysAgoUseCase}) : super(WeatherInitial()) {
//     on<GetWeatherEvent>(_onGetWeatherEvent);
//    on<GetThreeDaysAgoEvent>(_onGetThreeDaysAgoEvent);
//   }
//
//   Future<void> _onGetWeatherEvent(GetWeatherEvent event, Emitter<WeatherState> emit) async {
//     emit(WeatherLoading());
//
//     final result = await getWeatherUseCase(event.city); // assumes use case takes a city
//
//     result.fold(
//           (failure) {
//         if (failure is ServerFailure) {
//           emit(WeatherError('Server error: ${failure.message}'));
//         } else if (failure is NetworkFailure) {
//           emit(WeatherError('Network unavailable'));
//         } else {
//           emit(WeatherError(failure.message));
//         }
//       },
//           (weatherModel) => emit(WeatherFeatched(weatherModel)),
//     );
//   }
//   Future<void> _onGetThreeDaysAgoEvent(GetThreeDaysAgoEvent event, Emitter<WeatherState> emit) async {
//     emit(WeatherLoading());
//     final result = await getThreeDaysAgoUseCase(event.city); // assumes use case takes a city
//     result.fold(
//           (failure) {
//         if (failure is ServerFailure) {
//           emit(WeatherError('Server error: ${failure.message}'));
//         } else if (failure is NetworkFailure) {
//           emit(WeatherError('Network unavailable'));
//         } else {
//           emit(WeatherError(failure.message));
//         }
//       },
//           (weatherModel) => emit(WeatherHistoryFeatched(weatherModel)),
//     );
//   }
//
//   }

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/home/domain/entities/weather_model.dart';
import 'package:weather_app/features/home/domain/use_cases/get_three_days_ago.dart';
import 'package:weather_app/features/home/domain/use_cases/get_weather_use_case.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetThreeDaysAgoUseCase getThreeDaysAgoUseCase;

  WeatherModel? _forecastModel;
  List<WeatherModel> _historyList = [];

  WeatherBloc({
    required this.getWeatherUseCase,
    required this.getThreeDaysAgoUseCase,
  }) : super(WeatherInitial()) {
    on<GetWeatherEvent>(_onGetWeatherEvent);
    on<GetThreeDaysAgoEvent>(_onGetThreeDaysAgoEvent);
  }

  Future<void> _onGetWeatherEvent(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    final result = await getWeatherUseCase(event.city);

    result.fold(
          (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
          (weatherModel) {
        _forecastModel = weatherModel;
        if (_historyList.isNotEmpty) {
          emit(WeatherCombinedData(
            forecastModel: _forecastModel!,
            historyList: _historyList,
          ));
        } else {
          emit(WeatherFeatched(_forecastModel!));
        }
      },
    );
  }

  Future<void> _onGetThreeDaysAgoEvent(
      GetThreeDaysAgoEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    final result = await getThreeDaysAgoUseCase(event.city);

    result.fold(
          (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
          (weatherList) {
        _historyList = weatherList;
        if (_forecastModel != null) {
          emit(WeatherCombinedData(
            forecastModel: _forecastModel!,
            historyList: _historyList,
          ));
        } else {
          emit(WeatherHistoryFeatched(_historyList));
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server error: ${failure.message}';
    } else if (failure is NetworkFailure) {
      return 'Network unavailable';
    } else {
      return failure.message;
    }
  }
}
