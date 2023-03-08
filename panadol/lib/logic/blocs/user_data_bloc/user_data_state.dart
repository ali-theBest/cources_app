part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState extends Equatable {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  const UserDataInitial();
  @override
  List<Object?> get props => [];
}

class GotUserDataState extends UserDataState {
  final MyUser user;
  const GotUserDataState({required this.user});
  @override
  List<Object?> get props => [user];
}

class GetUserDataErrorState extends UserDataState {
  final String error;
  const GetUserDataErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

class GetUserDataLoadingState extends UserDataState {
  final bool loading;
  const GetUserDataLoadingState({required this.loading});
  @override
  List<Object?> get props => [loading];
}

class PushUserDataState extends UserDataState {
  final bool pushed;
  const PushUserDataState({required this.pushed});
  @override
  List<Object?> get props => [pushed];
}

class PushUserDataErrorState extends UserDataState {
  final String error;
  const PushUserDataErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

class PushUserDataLoadingState extends UserDataState {
  final bool loading;
  const PushUserDataLoadingState({required this.loading});
  @override
  List<Object?> get props => [loading];
}

class NewUserDataPushedState extends UserDataState {
  const NewUserDataPushedState();
  @override
  List<Object?> get props => [];
}
