// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpErrorState extends AuthState {
  final String errorMessage;
  SignUpErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

class SignInLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignInSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignInErrorState extends AuthState {
  final String errorMessage;
  SignInErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [];
}

class GoogleSignInLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class GoogleSignInSuccessState extends AuthState {
  final GoogleSignInAccount? googleSignInData;
  GoogleSignInSuccessState({
    this.googleSignInData,
  });

  @override
  List<Object?> get props => [googleSignInData];
}

class GoogleSignInErrorState extends AuthState {
  final String errorMessage;
  GoogleSignInErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
