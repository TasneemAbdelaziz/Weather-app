import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<MyUser,NoParams>{

  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  Future<Either<Failure,MyUser>> call(NoParams params)async{
    return await authRepository.currentUser();
  }
}

