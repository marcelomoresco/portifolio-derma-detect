part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.signOutStatus = Status.initial,
    this.profilePictureStatus = Status.initial,
    this.failure,
    this.profilePicturePath,
    this.showModalPermission = false,
    this.isCamera = false,
  });

  final Failure? failure;
  final String? profilePicturePath;
  final Status signOutStatus;
  final Status profilePictureStatus;
  final bool showModalPermission;
  final bool isCamera;

  @override
  List<Object?> get props => [
        signOutStatus,
        profilePictureStatus,
        failure,
        profilePicturePath,
        showModalPermission,
        isCamera,
      ];

  ProfileState copyWith({
    Failure? failure,
    String? profilePicturePath,
    Status? signOutStatus,
    Status? profilePictureStatus,
    bool? showModalPermission,
    bool? isCamera,
  }) {
    return ProfileState(
      failure: failure ?? this.failure,
      profilePicturePath: profilePicturePath ?? this.profilePicturePath,
      signOutStatus: signOutStatus ?? this.signOutStatus,
      profilePictureStatus: profilePictureStatus ?? this.profilePictureStatus,
      showModalPermission: showModalPermission ?? this.showModalPermission,
      isCamera: isCamera ?? this.isCamera,
    );
  }
}
