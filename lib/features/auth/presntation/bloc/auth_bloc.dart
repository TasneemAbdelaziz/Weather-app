// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async{
       final res =await _userSignUp(UserSignUpParams(email: event.email, name: event.name, password: event.password));
       res.fold((l)=>emit(AuthFailure(l.message)), (r)=>emit(AuthSuccess(r)));
    });
  }
}
