// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:panadol/models/firebase/apis/auth_api.dart';
import 'package:panadol/models/firebase/apis/user_data_api.dart';
import 'package:panadol/models/user.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final userDataApi = UserDataApi();
  final auth = FirebaseAuthApi();
  
  UserDataBloc() : super(const UserDataInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(const GetUserDataLoadingState(loading: true));
      Map<bool, dynamic> user = await userDataApi.getUserData(
        id: event.id,
      );
      if (user.keys.first) {
        emit(GotUserDataState(user: user.values.first));
        emit(const GetUserDataLoadingState(loading: false));
      } else {
        emit(const GetUserDataLoadingState(loading: false));
        emit(GetUserDataErrorState(error: user.values.first));
      }
    });
    on<PushUserDataEvent>((event, emit) async {
      emit(const PushUserDataLoadingState(loading: true));

      String dataPushed = await userDataApi.addUserDate(user: event.myUser);
      if (dataPushed == 'done') {
        emit(const PushUserDataLoadingState(loading: false));
        emit(const NewUserDataPushedState());
      } else {
        emit(const PushUserDataLoadingState(loading: false));
        emit(PushUserDataErrorState(error: dataPushed));
      }
    });
  }
}
