import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future <Either <Faliures , AuthResponseEntity>> register
(String name , String email , String password , String repassword , String phone );
Future <Either <Faliures , AuthResponseEntity>> login
( String email , String password );
}