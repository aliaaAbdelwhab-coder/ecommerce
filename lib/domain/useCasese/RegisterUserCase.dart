import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';
import 'package:ecommerce/domain/repositories/AuthRepositiory.dart';
import 'package:injectable/injectable.dart';
@injectable
class Registerusercase {
  Authrepositiory authRepositiory;
  Registerusercase({required this.authRepositiory});

Future <Either <Faliures , AuthResponseEntity>> invoke(String name , String email , String password , String repassword , String phone ) {
  return  authRepositiory.register(name, email, password, repassword, phone);
  }
}
