// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'package:photo_fit_user/config/utils/shared_prefs.dart';
import 'package:photo_fit_user/constants/image_path.dart';
import 'package:photo_fit_user/constants/string_constants.dart';
import 'package:photo_fit_user/routes/api_routes.dart';

final authRepositaryProvider = Provider<AuthRepositary>((ref) {
  return AuthRepositary();
});

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

  Future<ErrorHandel> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    String endpoints = '${ApiRoutes.baseUrl}signup';
    Uri url = Uri.parse(endpoints);

    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "name": name, "password": password}));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final data = decodedData['message'];
      return ErrorHandel(successData: data, errorMessage: null);
    } else {
      final decodedData = jsonDecode(response.body);
      final data = decodedData['error'];
      return ErrorHandel(errorMessage: data, successData: null);
    }
  }

  Future<ErrorHandel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    String endpoint = '${ApiRoutes.baseUrl}signin';
    Uri url = Uri.parse(endpoint);
    SharedPreferencesHelper prefs = await SharedPreferencesHelper.getInstance();
    Map<String, String> headers = {"Content-Type": "application/json"};
    http.Response response = await http.post(url,
        headers: headers,
        body: jsonEncode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final data = decodedData['token'];
      await prefs.setString(StringContants.authToken, data);
      return ErrorHandel(successData: data, errorMessage: null);
    } else {
      final decodedData = jsonDecode(response.body);
      final data = decodedData['error'];
      return ErrorHandel(errorMessage: data, successData: null);
    }
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    SharedPreferencesHelper prefs = await SharedPreferencesHelper.getInstance();
    GoogleSignInAccount? userCredentials = await googleSignIn.signIn();
    if (userCredentials != null) {
      final auth = await userCredentials.authentication;
      String? token = auth.accessToken;
      if (token != null) {
        await prefs.setString(StringContants.googleToken, token);
      }
      log(auth.accessToken.toString());
    }

    return userCredentials;
  }
}

class ErrorHandel {
  final String? successData;
  final String? errorMessage;
  ErrorHandel({
    this.successData,
    this.errorMessage,
  });
}
