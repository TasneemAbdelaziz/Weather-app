import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/src/supabase.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/auth/data/datasoures/supabase_datasource.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final SupabaseDatasource supabaseDatasource;
  const AuthRepositoryImpl(this.supabaseDatasource);

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({required String name, required String email, required String password})async {
    // TODO: implement signUpWithEmailAndPassword
    try{
      final userId = await supabaseDatasource.signUpWithEmailPassword(name: name, email: email, password: password);
      return right(userId);

    }
    catch(e){
      return left(Failure(e.toString()));
    }
  }
  
}