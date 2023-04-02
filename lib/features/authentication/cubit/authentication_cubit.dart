// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:photo_fit_user/features/authentication/repository/auth_repo.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  AuthRepositary authRepositary = AuthRepositary();

  void userSignUp({required String email, required String password}) async {
    emit(RegistrationLoadingState());
    try {
      await authRepositary.signUp(email: email, password: password);
      emit(RegistrationSuccessfulState());
    } on FirebaseAuthException catch (e) {
      emit(RegistrationErrorState(errMsg: e.message.toString()));
    }
  }

  void userSignIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await authRepositary.login(email: email, password: password);
      emit(LoginSuccessfullState());
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(errorMessage: e.message!.replaceAll('-', ' ')));
    }
  }

  void userSignOut() async {
    emit(SignOutLoadingState());
    try {
      await authRepositary.signOut();
      emit(SignOutSuccessfullyState());
    } on FirebaseAuthException catch (e) {
      emit(SignOutFailedState(errMsg: e.message.toString()));
    }
  }

  void signInWithGoogle() async {
    emit(GoogleSignInLoadingState());
    try {
      GoogleSignInAccount? userGoogleCred =
          await authRepositary.signInWithGoogle();
      if (userGoogleCred != null) {
        emit(GoogleSignInSuccessState(googleSignInData: userGoogleCred));
      } else {
        emit(GoogleSignInErrorState(
            errorMessage: 'Signing in by Google cancelled'));
      }
    } on SocketException catch (e) {
      emit(GoogleSignInErrorState(errorMessage: e.message));
    }
  }
}
