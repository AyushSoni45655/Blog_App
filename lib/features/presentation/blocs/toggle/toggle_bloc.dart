import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleButtonSate> {
  ToggleBloc() : super(ToggleButtonSate(isToggle: false)) {
    on<ToggleButtonEvent>((event, emit) {
     emit(ToggleButtonSate(isToggle: !state.isToggle));
    });
  }
}
