// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class WelcomeState extends Equatable {
  const WelcomeState({
    this.status = Status.initial,
  });
  final Status status;

  @override
  List<Object?> get props => [
        status,
      ];

  WelcomeState copyWith({
    Status? status,
  }) {
    return WelcomeState(
      status: status ?? this.status,
    );
  }
}
