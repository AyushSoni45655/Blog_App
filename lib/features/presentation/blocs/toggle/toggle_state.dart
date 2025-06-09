part of 'toggle_bloc.dart';

@immutable
sealed class ToggleState {}

final class ToggleInitial extends ToggleState {}
final class ToggleButtonSate extends ToggleState{
  final bool isToggle;
  ToggleButtonSate({required this.isToggle});
}