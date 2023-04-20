import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_fit_user/features/authentication/controller/auth_states.dart';
import 'package:photo_fit_user/features/authentication/repository/auth_repo.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(authRepositary: ref.read(authRepositaryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required this.authRepositary}) : super(AuthInitialState());

  AuthRepositary authRepositary;

  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      state = SignUpLoadingState();
      final response = await authRepositary.signUpWithEmailAndPassword(
          email: email, password: password, name: name);
      if (response.successData != null) {
        state = SignUpSuccessState();
      } else {
        state =
            SignUpErrorState(errorMessage: response.errorMessage.toString());
      }
    } on SocketException catch (e) {
      state = SignUpErrorState(errorMessage: e.message.toString());
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      state = SignInLoadingState();
      final response = await authRepositary.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.successData != null) {
        state = SignInSuccessState();
      } else {
        state =
            SignInErrorState(errorMessage: response.errorMessage.toString());
      }
    } on SocketException catch (e) {
      state = SignInErrorState(errorMessage: e.message.toString());
    }
  }

  Future signInWithGoogle() async {
    try {
      state = GoogleSignInLoadingState();
      GoogleSignInAccount? userGoogleCred =
          await authRepositary.signInWithGoogle();
      if (userGoogleCred != null) {
        state = GoogleSignInSuccessState(googleSignInData: userGoogleCred);
      } else {
        state = GoogleSignInErrorState(
            errorMessage: 'Signing in by Google cancelled');
      }
    } on SocketException catch (e) {
      state = GoogleSignInErrorState(
            errorMessage: e.message.toString());
    }
  }
}
