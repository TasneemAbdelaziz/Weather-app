// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/usecase/current_user.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_in.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_up.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;

  AuthBloc(
      {required UserSignUp userSignUp,
      required UserSignIn userSignIn,
      required CurrentUser currentUser})
      : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }
  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());
    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) {
        print(r.email);
        emit(AuthSuccess(r));
      },
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserSignUpParams(
        email: event.email, name: event.name, password: event.password));
    res.fold(
        (l) => emit(AuthFailure(l.message)), (user) => emit(AuthSuccess(user)));
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));
    res.fold(
        (l) => emit(AuthFailure(l.message)), (user) => emit(AuthSuccess(user)));
  }
}
