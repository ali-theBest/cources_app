// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panadol/models/firebase/apis/auth_api.dart';
import 'package:panadol/models/firebase/apis/user_data_api.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  FirebaseAuthApi authApi = FirebaseAuthApi();
  final _firebaseUserDataApi = UserDataApi();
  PhoneAuthBloc() : super(const AuthInitial()) {
    on<SignInPhoneEvent>((event, emit) async {
      emit(const CodeRequestedState());
      authApi.signInPhone(
        phoneNumber: event.phoneNumber,
      );
    });
    on<GetOTPCodeEvent>((event, emit) async {
      String verified = await authApi.verifyOTP(
        otp: event.code,
      );
      if (verified == 'done') {
        String isExist = await _firebaseUserDataApi.isUserExists(id: event.id);
        if (isExist=='done') {
          emit(const UserAlreadyRegisteredPhoneState());
        } else {
          emit( NewPhoneUserState(userId: event.id));
        }
      } else {
        emit(SignInErrorState(error: verified));
      }
    });
  }
}
