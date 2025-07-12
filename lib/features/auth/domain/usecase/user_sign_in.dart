import 'package:fpdart/src/either.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class UserSignIn implements UseCase<MyUser,UserSignInParams>{
  final AuthRepository authRepository;
  const UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, MyUser>> call(UserSignInParams params) async{
    return await authRepository.signInWithEmailAndPassword(email: params.email, password: params.password);
  }

}
class UserSignInParams{
  final String email;
  final String password;
  UserSignInParams({
    required this.email,
    required this.password
  });
}