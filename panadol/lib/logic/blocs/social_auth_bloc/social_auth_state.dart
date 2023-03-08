part of 'social_auth_bloc.dart';

@immutable
abstract class SocialAuthState extends Equatable {
  const SocialAuthState();

  @override
  List<Object?> get props => [];
}

class GoogleSignInInitial extends SocialAuthState {
  const GoogleSignInInitial();

  @override
  List<Object?> get props => [];
}

/*class GoogleSignInSuccessfullyState extends SocialAuthState {
  final String id;
  const GoogleSignInSuccessfullyState({required this.id});

  @override
  List<Object?> get props => [id];
}*/

class GoogleSignInErrorState extends SocialAuthState {
  final String? error;
  const GoogleSignInErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error!];
}

class FacebookSignInErrorState extends SocialAuthState {
  final String? error;
  const FacebookSignInErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error!];
}

class AppleSignInErrorState extends SocialAuthState {
  final String? error;
  const AppleSignInErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error!];
}

class SignOutSuccessfullyState extends SocialAuthState {
  const SignOutSuccessfullyState();
  @override
  List<Object?> get props => [];
}

class SignOutErrorState extends SocialAuthState {
  const SignOutErrorState({
    required this.error,
  });
  final String error;
  @override
  List<Object?> get props => [error];
}

class UserAlreadyRegisteredSocialState extends SocialAuthState {
  const UserAlreadyRegisteredSocialState({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}

class NewSocialUserState extends SocialAuthState {
  const NewSocialUserState({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}
