import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/src/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/auth/data/datasoures/supabase_datasource.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final SupabaseDatasource supabaseDatasource;
  const AuthRepositoryImpl(this.supabaseDatasource);

  @override
  Future<Either<Failure, MyUser>> signInWithEmailAndPassword({required String email, required String password}) async{
    // TODO: implement signInWithEmailAndPassword
    try{
      final user = await supabaseDatasource.signInWithEmailPassword(email: email, password: password);
      return right(user);
    }
    catch(e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyUser>> signUpWithEmailAndPassword({required String name, required String email, required String password})async {
    // TODO: implement signUpWithEmailAndPassword
    try{
      final user = await supabaseDatasource.signUpWithEmailPassword(name: name, email: email, password: password);
      return right(user);

    }
    catch(e){
      return left(Failure(e.toString()));
    }
  }

  // Future<Either<Failure,MyUser>> getUSer(
  //     Future<MyUser>Function() fn,
  //     )async{
  //   try{
  //     final user = await fn();
  //     return right(user);
  //   }catch(e){
  //     return left(Failure(e.toString()));
  //   }
  // }
}