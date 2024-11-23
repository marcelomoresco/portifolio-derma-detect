part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    this.currentIndex = 0,
  });
  final int currentIndex;

  @override
  List<Object?> get props => [
        currentIndex,
      ];

  MainState copyWith({
    int? currentIndex,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
