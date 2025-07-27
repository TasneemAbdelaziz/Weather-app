import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/secrets/app_secrets.dart';
import 'package:weather_app/features/auth/data/datasoures/supabase_datasource.dart';
import 'package:weather_app/features/auth/data/repositries/auth_repository_impl.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:weather_app/features/auth/domain/usecase/current_user.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_in.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_up.dart';
import 'package:weather_app/features/auth/presntation/bloc/auth_bloc.dart';
import 'package:weather_app/features/home/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/data/repositories/weather_repo_impl.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';
import 'package:weather_app/features/home/domain/use_cases/get_three_days_ago.dart';
import 'package:weather_app/features/home/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initDependices() async {
  final supabse = await Supabase.initialize(
      url: AppSecrets.SupabaseUrl, anonKey: AppSecrets.SupabaseAnnokey);
  serviceLocator.registerSingleton<SupabaseClient>(supabse.client);
  initAuth();
  initWeather();
}

void initAuth() {
  // Data source
  serviceLocator
    ..registerFactory<SupabaseDatasource>(
      () => SupabaseDatasourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<AuthRepository>(() => AuthRepositoryImpl(serviceLocator()))
    // Use-cases
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignIn(
        serviceLocator(),
      ),
    )
    ..registerFactory(
          () => CurrentUser(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(() =>
        AuthBloc(currentUser:serviceLocator() ,userSignUp: serviceLocator(), userSignIn: serviceLocator()));



}

void initWeather(){
  serviceLocator.registerLazySingleton<http.Client>(() => http.Client());

  serviceLocator
    ..registerFactory<WeatherRemoteDataSource>(
      ()=>WeatherRemoteDataSource(serviceLocator())
  )
    ..registerFactory<WeatherRepo>(
            ()=>WeatherRepoImpl(remoteDataSource: serviceLocator())
    )
    ..registerFactory<GetWeatherUseCase>(
            ()=>GetWeatherUseCase(serviceLocator())
    )
    ..registerFactory(
          () => GetThreeDaysAgoUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(() =>
        WeatherBloc(getWeatherUseCase: serviceLocator(),getThreeDaysAgoUseCase: serviceLocator())
    );

}
