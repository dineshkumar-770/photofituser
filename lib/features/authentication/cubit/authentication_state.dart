// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class RegistrationLoadingState extends AuthenticationState {}

class RegistrationSuccessfulState extends AuthenticationState {}

class RegistrationErrorState extends AuthenticationState {
  final String errMsg;

  RegistrationErrorState({required this.errMsg});
}

class LoginSuccessfullState extends AuthenticationState {}

class LoginErrorState extends AuthenticationState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends AuthenticationState {}

class SignOutLoadingState extends AuthenticationState {}

class SignOutSuccessfullyState extends AuthenticationState {}

class SignOutFailedState extends AuthenticationState {
  final String errMsg;
  SignOutFailedState({required this.errMsg});
}

class GoogleSignInLoadingState extends AuthenticationState {}

class GoogleSignInSuccessState extends AuthenticationState {
  final GoogleSignInAccount? googleSignInData;
  GoogleSignInSuccessState({
    this.googleSignInData,
  });
}

class GoogleSignInErrorState extends AuthenticationState {
  final String errorMessage;
  GoogleSignInErrorState({
    required this.errorMessage,
  });
}

class GoogleSignInInitialState extends AuthenticationState {}
