// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_in.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,

        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    // on<AuthSignIn>();

  }
  void _onAuthSignUp(AuthSignUp event,Emitter<AuthState> emit)async{
    emit(AuthLoading());
    final res =await _userSignUp(UserSignUpParams(email: event.email, name: event.name, password: event.password));
    res.fold((l)=>emit(AuthFailure(l.message)), (user)=>emit(AuthSuccess(user)));
  }
  void _onAuthSignIn(AuthSignIn event,Emitter<AuthState> emit)async {
    emit(AuthLoading());
    final res =await _userSignIn(UserSignInParams(email: event.email, password: event.password));
    res.fold((l)=>emit(AuthFailure(l.message)), (user)=>emit(AuthSuccess(user)));
  }
  }
