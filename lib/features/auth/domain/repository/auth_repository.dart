import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/error/failure.dart';

abstract interface class AuthRepository{
  Future<Either<Failure,String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,

});
  Future<Either<Failure,String>>  signInWithEmailAndPassword({
    required String email,
    required String password,
});
}