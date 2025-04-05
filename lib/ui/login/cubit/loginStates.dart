
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';

abstract class Loginstates {}

class LoginInitState extends Loginstates {}

class LoginLoadingState extends Loginstates {}

class LoginSuccessState extends Loginstates {
  AuthResponseEntity responseEntity;
  LoginSuccessState({required this.responseEntity});
}

class LoginErrorState extends Loginstates {
  Faliures error;
  LoginErrorState({required this.error});
}
