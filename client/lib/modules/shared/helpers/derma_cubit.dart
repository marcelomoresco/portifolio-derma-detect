import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DermaCubit<State> extends Cubit<State> with SafeCubitEmitter<State> {
  DermaCubit(super.initialState);

  FutureOr<void> onInitState() async {}

  FutureOr<void> onDispose() async {}
}

mixin SafeCubitEmitter<State> on Cubit<State> {
  @override
  void emit(State state) {
    if (!isClosed) super.emit(state);
  }
}
