part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}
class NavigationButtonEvent extends NavigationEvent{
  final int index;
  NavigationButtonEvent({required this.index});
}