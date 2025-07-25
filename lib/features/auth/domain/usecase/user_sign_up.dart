import 'package:fpdart/src/either.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<MyUser,UserSignUpParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, MyUser>> call(UserSignUpParams params) async{
   return await authRepository.signUpWithEmailAndPassword(name: params.name, email: params.email, password: params.password);
  }

}
class UserSignUpParams{
  final String email;
  final String name;
  final String password;
  UserSignUpParams({
    required this.email,
    required this.name,
    required this.password
});
}