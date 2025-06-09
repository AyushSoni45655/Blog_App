part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}
class UserSignInEvent extends UserEvent{
  final String email;
  final String password;
  UserSignInEvent({required this.email,required this.password});
}
class UserSignUpEvent extends UserEvent{
  final UserEntity entity;
  UserSignUpEvent({required this.entity});
}
class UserForgotPasswordEvent extends UserEvent{
  final String email;
  UserForgotPasswordEvent({required this.email});
}
class UserLogOutEvent extends UserEvent{}
class UserIsLoggedInEvent extends UserEvent{}