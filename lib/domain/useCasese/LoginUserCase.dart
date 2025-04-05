import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';
import 'package:ecommerce/domain/repositories/AuthRepositiory.dart';
import 'package:injectable/injectable.dart';
@injectable
 class Loginusercase {
  Authrepositiory authRepositiory;
  Loginusercase({required this.authRepositiory});

Future <Either <Faliures , AuthResponseEntity>> invoke( String email , String password  ) {
  return  authRepositiory.login(email, password, );
  }
}
