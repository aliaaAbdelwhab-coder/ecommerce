import 'package:dartz/dartz.dart';
import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';
import 'package:ecommerce/core/errors/faliures.dart';

abstract class Registerrepositiory {
Future <Either <Faliures , RegisterResponseEntity>> register
(String name , String email , String password , String repassword , String phone );
}
