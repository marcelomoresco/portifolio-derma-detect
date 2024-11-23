import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends DermaCubit<MainState> {
  MainCubit() : super(const MainState());

  // Actions
  void onTabTap(int index, BuildContext context) {
    openTab(index);
  }

  // Navigation
  void openTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
