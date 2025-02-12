import 'package:dartz/dartz.dart';
import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';
import 'package:ecommerce/Regester/domain/repositories/RegisterRepositiory.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';
@injectable
class Registerusercase {
  Registerrepositiory registerrepositiory;
  Registerusercase({required this.registerrepositiory});

Future <Either <Faliures , RegisterResponseEntity>> invoke(String name , String email , String password , String repassword , String phone ) {
  return  registerrepositiory.register(name, email, password, repassword, phone);
  }
}
