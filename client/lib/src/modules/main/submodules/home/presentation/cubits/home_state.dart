part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.userStatus = Status.initial,
    this.failure,
    this.dermaUser,
  });

  final Failure? failure;
  final Status userStatus;
  final DermaUser? dermaUser;

  @override
  List<Object?> get props => [
        userStatus,
        failure,
        dermaUser,
      ];

  HomeState copyWith({
    Failure? failure,
    Status? userStatus,
    DermaUser? dermaUser,
  }) {
    return HomeState(
      failure: failure ?? this.failure,
      userStatus: userStatus ?? this.userStatus,
      dermaUser: dermaUser ?? this.dermaUser,
    );
  }
}
