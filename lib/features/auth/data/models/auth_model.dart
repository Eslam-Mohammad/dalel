import '../../domain/entities/auth_entitiy.dart';

class AuthModel extends AuthEntity {
  AuthModel();

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
