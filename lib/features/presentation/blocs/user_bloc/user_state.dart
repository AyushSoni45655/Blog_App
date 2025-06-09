part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
final class UserLoadingState extends UserState{}
final class UserLoadedState extends UserState{
  final UserEntity userEntity;
  UserLoadedState({required this.userEntity});
}
final class UserSuccessState extends UserState{
  final UserEntity userEntity;
  UserSuccessState({required this.userEntity});
}
final class UserErrorState extends UserState{
  final String error;
  UserErrorState({required this.error});
}
final class UserLogOutState extends UserState{}
final class UserIsLoggedInState extends UserState{}
final class UserForgotPasswordState extends UserState{}