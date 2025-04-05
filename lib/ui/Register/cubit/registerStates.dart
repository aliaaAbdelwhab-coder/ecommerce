
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';

abstract class Registerstates {}

class InitState extends Registerstates {}

class LoadingState extends Registerstates {}

class SuccessState extends Registerstates {
  AuthResponseEntity responseEntity;
  SuccessState({required this.responseEntity});
}

class ErrorState extends Registerstates {
  Faliures error;
  ErrorState({required this.error});
}
