part of 'user_data_bloc.dart';

@immutable
abstract class UserDataEvent extends Equatable {
  const UserDataEvent();
}

class GetUserDataEvent extends UserDataEvent {
  const GetUserDataEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class PushUserDataEvent extends UserDataEvent {
  const PushUserDataEvent({
    required this.myUser,
  });
  final MyUser myUser;
  @override
  List<Object?> get props => [myUser];
}
