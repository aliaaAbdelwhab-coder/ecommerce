import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';

abstract class Hometabstates {}
class homeTabeInitialState extends Hometabstates{}

class homeTabeLoadingState extends Hometabstates {}

class homeTabeSuccessState extends Hometabstates {
  CategoryAndBrandsResponseEntity categoryResponseEntity;
  homeTabeSuccessState({required this.categoryResponseEntity});
}

class homeTabeErrorState extends Hometabstates {
  Faliures error;
  homeTabeErrorState({required this.error});
}
class brandLoadingState extends Hometabstates {}

class brandSuccessState extends Hometabstates {
  CategoryAndBrandsResponseEntity categoryAndBrandsResponseEntity;
  brandSuccessState({required this.categoryAndBrandsResponseEntity});
}

class brandErrorState extends Hometabstates {
  Faliures error;
  brandErrorState({required this.error});
}
