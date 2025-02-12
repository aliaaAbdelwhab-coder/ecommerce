class RegisterResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  String? stauseMsg;
  RegisterResponseEntity({this.message, this.user, this.token , this.stauseMsg});
}

class UserEntity {
  String? name;
  String? email;
  UserEntity({this.name, this.email});
}
