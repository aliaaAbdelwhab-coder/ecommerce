import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';
import 'package:ecommerce/core/errors/faliures.dart';

abstract class Registerstates {}

class InitState extends Registerstates {}

class LoadingState extends Registerstates {}

class SuccessState extends Registerstates {
  RegisterResponseEntity responseEntity;
  SuccessState({required this.responseEntity});
}

class ErrorState extends Registerstates {
  Faliures error;
  ErrorState({required this.error});
}
