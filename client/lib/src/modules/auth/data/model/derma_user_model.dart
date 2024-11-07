import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';

class DermaUserModel extends DermaUser {
  const DermaUserModel({
    required super.email,
    required super.name,
    required super.token,
  });
  factory DermaUserModel.fromJson(Map<String, dynamic> json) {
    return DermaUserModel(
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}
