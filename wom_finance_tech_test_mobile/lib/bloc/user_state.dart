part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserLoadedFailed extends UserState {
  final String message;

  const UserLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}

class AuthSuccessLogout extends UserState {}
