import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>(_switchOnEvent);
    on<SwitchOffEvent>(_switchOffEvent);
  }

  FutureOr<void> _switchOnEvent(
      SwitchOnEvent event, Emitter<SwitchState> emit) {
    emit(const SwitchState(switchValue: true));
  }

  FutureOr<void> _switchOffEvent(
      SwitchOffEvent event, Emitter<SwitchState> emit) {
    emit(const SwitchState(switchValue: false));
  }
}
