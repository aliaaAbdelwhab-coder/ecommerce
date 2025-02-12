import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';
import 'package:ecommerce/core/errors/faliures.dart';

abstract class Loginstates {}

class InitState extends Loginstates {}

class LoadingState extends Loginstates {}

class SuccessState extends Loginstates {
  RegisterResponseEntity responseEntity;
  SuccessState({required this.responseEntity});
}

class ErrorState extends Loginstates {
  Faliures error;
  ErrorState({required this.error});
}
