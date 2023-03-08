// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final facebookAuth = FacebookAuth.instance;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  String verificationId = "";

  bool get isUser {
    User? user = _auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  String? get userEmail {
    User? user = _auth.currentUser;
    return user!.email;
  }

  Future<String> signInWithFacebook() async {
    try {
      print('start');
      final LoginResult result = await facebookAuth.login();

      final accessToken = result.accessToken!.token;
      print('access token : $accessToken');

      final facebookCredential = FacebookAuthProvider.credential(accessToken);

      await singInWithCred(facebookCredential);
      return 'done';
    } on FirebaseException catch (e) {
      print('some thing went wrong ,please try another way to sing in');
      return e.code;
    } on MissingPluginException catch (e) {
      print(e.message);
      return e.message!;
    }
  }

  Future<String> signInGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser== null) {
        throw PlatformException(code: 'no accounts selected');
      }
      
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await singInWithCred(credential);
      return 'done';
    } on PlatformException catch (e) {
      return e.code;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<UserCredential> singInWithCred(AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }

  Future<String> signInPhone({
    required String phoneNumber,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        codeSent: (
          String verificationId,
          int? resendToken,
        ) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
      );
      return 'done';
    } on FirebaseException catch (e) {
      return e.code;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<String> verifyOTP({required String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      UserCredential userCredential = await singInWithCred(credential);
      return 'done';
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<String?> signOut() async {
    try {
      await _auth.signOut();
      return 'You Sign Out';
    } on FirebaseException catch (e) {
      print(e.code);
      return e.code;
    }
  }
}
