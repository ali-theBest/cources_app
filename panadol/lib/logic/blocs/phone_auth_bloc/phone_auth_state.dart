part of 'phone_auth_bloc.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends PhoneAuthState {
  const AuthInitial({isLoggedIn = false});
  @override
  List<Object?> get props => [];
}

class SignInLoadingState extends PhoneAuthState {
  final bool loading;
  const SignInLoadingState({
    required this.loading,
  });
  @override
  List<Object?> get props => [loading];
}

/*class SignInSuccessfullyState extends PhoneAuthState {
  const SignInSuccessfullyState();

  @override
  List<Object?> get props => [];
}*/

class SignInErrorState extends PhoneAuthState {
  final String? error;
  const SignInErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error!];
}

class CodeRequestedState extends PhoneAuthState {
  const CodeRequestedState();
  @override
  List<Object?> get props => [];
}

class SignOutState extends PhoneAuthState {
  const SignOutState();
  @override
  List<Object?> get props => [];
}

class SignOutErrorState extends PhoneAuthState {
  const SignOutErrorState();
  @override
  List<Object?> get props => [];
}

class UserAlreadyRegisteredPhoneState extends PhoneAuthState {
  const UserAlreadyRegisteredPhoneState();
  @override
  List<Object?> get props => [];
}

class NewPhoneUserState extends PhoneAuthState {
  const NewPhoneUserState({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}
