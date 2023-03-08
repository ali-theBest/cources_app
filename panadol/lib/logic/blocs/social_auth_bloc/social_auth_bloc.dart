// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
import 'package:panadol/models/firebase/apis/auth_api.dart';
import 'package:panadol/models/firebase/apis/user_data_api.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  final _firebaseAuthApi = FirebaseAuthApi();
  SocialAuthBloc() : super(const GoogleSignInInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      String signInSuccess = await _firebaseAuthApi.signInGoogle();

      if (signInSuccess == 'done') {
        String? userEmail = _firebaseAuthApi.userEmail;
        final UserDataApi userDataApi = UserDataApi();
        String isRegistered = await userDataApi.isUserExists(id: userEmail!);
        if (isRegistered =='done') {
          emit( UserAlreadyRegisteredSocialState(userId: userEmail));
          // ignore: dead_code
        } else {
          emit( NewSocialUserState(userId: userEmail));
        }
      } else {
        emit(GoogleSignInErrorState(error: signInSuccess));
      }
    });
    on<SignInWithFacebookEvent>((event, emit) async {
      String isSignedIn = await _firebaseAuthApi.signInWithFacebook();
      if (isSignedIn == 'done') {
        String? userEmail = _firebaseAuthApi.userEmail;
        final UserDataApi userDataApi = UserDataApi();
        String isRegistered = await userDataApi.isUserExists(id: userEmail!);
        if (isRegistered =='done') {
          emit( UserAlreadyRegisteredSocialState(userId: userEmail));
          // ignore: dead_code
        } else {
          emit( NewSocialUserState(userId: userEmail));
        }
      } else {
        emit(FacebookSignInErrorState(error: isSignedIn));
      }
    });

    on<SocialSignOutEvent>((event, emit) async {
      String? result = await _firebaseAuthApi.signOut();
      if (result == 'You Sign Out') {
        emit(const SignOutSuccessfullyState());
      } else {
        emit(SignOutErrorState(error: result!));
      }
    });
  }
}
