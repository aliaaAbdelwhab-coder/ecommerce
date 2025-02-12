import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';

class RegisterResponseDM extends RegisterResponseEntity {


  RegisterResponseDM({ super.message, super.user, super.token , super.stauseMsg});

  RegisterResponseDM.fromJson(Map<String, dynamic> json) {
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

  static List<RegisterResponseDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterResponseDM.fromJson).toList();
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
