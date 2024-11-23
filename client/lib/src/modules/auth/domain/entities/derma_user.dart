import 'package:equatable/equatable.dart';

class DermaUser extends Equatable {
  const DermaUser({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    this.monthlyAnalyses,
  });
  final String id;
  final String email;
  final String name;
  final String? token;
  final int? monthlyAnalyses;

  bool get isLimitAnalyses => (monthlyAnalyses ?? 20) <= 0 ? true : false;

  @override
  List<Object?> get props => [id, email, name, token, monthlyAnalyses];
}
