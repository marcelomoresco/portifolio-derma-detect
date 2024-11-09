import 'package:equatable/equatable.dart';

class DermaUser extends Equatable {
  const DermaUser({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });
  final String id;
  final String email;
  final String name;
  final String token;

  @override
  List<Object?> get props => [email, name, token];
}
