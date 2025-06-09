part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}
final class NavigationButtonState extends NavigationState{
  final int cIndex;
  NavigationButtonState({required this.cIndex});
}