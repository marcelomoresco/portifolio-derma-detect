import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'derma_cubit.dart';

abstract class DermaCubitState<TWidget extends StatefulWidget, TBind extends DermaCubit> extends State<TWidget> {
  final TBind _cubit = Modular.get<TBind>();
  TBind get cubit => _cubit;

  bool get shouldDisposeBind => true;

  @override
  void initState() {
    super.initState();
    cubit.onInitState();
  }

  T? _typedCubit<T>() => cubit is T ? cubit as T : null;

  @override
  void dispose() {
    cubit.onDispose();
    if (shouldDisposeBind) {
      final isDisposed = Modular.dispose<TBind>();

      if (!isDisposed) {
        _typedCubit<Disposable>()?.dispose();
        _typedCubit<Sink>()?.close();
        _typedCubit<ChangeNotifier>()?.dispose();
      }
    }

    super.dispose();
  }
}
