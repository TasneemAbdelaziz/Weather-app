import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository{
  Future<Either<Failure,MyUser>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,

});
  Future<Either<Failure,MyUser>>  signInWithEmailAndPassword({
    required String email,
    required String password,
});
  Future<Either<Failure,MyUser>> currentUser();

}