import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';

class AuthResponseDM extends AuthResponseEntity {
  

  AuthResponseDM({super.message, super.user, super.token, super.stauseMsg});

  AuthResponseDM.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserDM.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<AuthResponseDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(AuthResponseDM.fromJson).toList();
  }
}

class UserDM extends UserEntity {
  String? role;

  UserDM({super.name, super.email, this.role});

  UserDM.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  static List<UserDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserDM.fromJson).toList();
  }
}
