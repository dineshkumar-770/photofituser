import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_fit_user/config/utils/shared_prefs.dart';
import 'package:photo_fit_user/constants/image_path.dart';

class AuthRepositary {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();

  Future login({required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    log(user.toString());
  }

  Future signUp({required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    SharedPreferencesHelper prefs = await SharedPreferencesHelper.getInstance();
    prefs.setString(userToken, user!.uid);
    log(prefs.getString(userToken).toString());
    log(user.toString());
  }

  Future signOut() async {
    await firebaseAuth.signOut();
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    SharedPreferencesHelper prefs = await SharedPreferencesHelper.getInstance();
    GoogleSignInAccount? userCredentials = await googleSignIn.signIn();
    if(userCredentials != null){
      final auth = await userCredentials.authentication;
    String? token = auth.accessToken;
    if (token != null) {
      await prefs.setString(googleToken, token);
    }
    log(auth.accessToken.toString());
    }
    
    return userCredentials;
  }
}
