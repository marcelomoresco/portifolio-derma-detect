part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.signOutStatus = Status.initial,
    this.deleteStatus = Status.initial,
    this.failure,
    this.showModalPermission = false,
    this.isCamera = false,
  });

  final Failure? failure;
  final Status signOutStatus;
  final Status deleteStatus;
  final bool showModalPermission;
  final bool isCamera;

  @override
  List<Object?> get props => [
        signOutStatus,
        failure,
        deleteStatus,
        showModalPermission,
        isCamera,
      ];

  ProfileState copyWith({
    Failure? failure,
    Status? signOutStatus,
    Status? deleteStatus,
    bool? showModalPermission,
    bool? isCamera,
  }) {
    return ProfileState(
      failure: failure ?? this.failure,
      signOutStatus: signOutStatus ?? this.signOutStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      showModalPermission: showModalPermission ?? this.showModalPermission,
      isCamera: isCamera ?? this.isCamera,
    );
  }
}
