part of 'social_auth_bloc.dart';

@immutable
abstract class SocialAuthEvent extends Equatable {
  const SocialAuthEvent();
  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends SocialAuthEvent {
  const SignInWithGoogleEvent();
  @override
  List<Object> get props => [];
}



class SignInWithFacebookEvent extends SocialAuthEvent {
  const SignInWithFacebookEvent();
  @override
  List<Object> get props => [];
}



class SignInWithAppleEvent extends SocialAuthEvent {
  const SignInWithAppleEvent();
  @override
  List<Object> get props => [];
}

class SocialSignOutEvent extends SocialAuthEvent {
  @override
  List<Object> get props => [];
}


