part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  AuthState();
}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {
  final MyUser user;
  AuthSuccess(this.user);
}
final class AuthFailure extends AuthState {
  final String message;
   AuthFailure(this.message);
}


