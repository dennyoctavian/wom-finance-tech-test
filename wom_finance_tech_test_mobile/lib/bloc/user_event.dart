part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {}

class RegisterUser extends UserEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String pictureUrl;
  final String address;
  final String phoneNumber;

  const RegisterUser(this.name, this.email, this.confirmPassword,
      this.pictureUrl, this.password, this.address, this.phoneNumber);

  @override
  List<Object> get props => [
        name,
        email,
        password,
        confirmPassword,
        pictureUrl,
        address,
        phoneNumber
      ];
}

class LoginUser extends UserEvent {
  final String email;
  final String password;

  const LoginUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogoutUser extends UserEvent {}

class WaitingUser extends UserEvent {}
