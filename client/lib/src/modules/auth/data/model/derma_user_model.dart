import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';

class DermaUserModel extends DermaUser {
  const DermaUserModel({
    required super.email,
    required super.name,
    super.token,
    required super.id,
  });
  factory DermaUserModel.fromJson(Map<String, dynamic> json) {
    return DermaUserModel(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token'],
    );
  }

  factory DermaUserModel.fromProfile(Map<String, dynamic> json) {
    return DermaUserModel(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
    );
  }
}
