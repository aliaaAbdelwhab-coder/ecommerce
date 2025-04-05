import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/cart_response_entity.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';

abstract class Categorytabstates {}
// class CategoryTabeInitialState extends Categorytabstates{}

class CategoryTabeLoadingState extends Categorytabstates {}

class CategoryTabeSuccessState extends Categorytabstates {
  ProductResponseEntity categoryResponseEntity;
  CategoryTabeSuccessState({required this.categoryResponseEntity});
}

class CategoryTabeErrorState extends Categorytabstates {
  Faliures error;
  CategoryTabeErrorState({required this.error});
}
class AddToCartLoadingState extends Categorytabstates {}

class AddToCartSuccessState extends Categorytabstates {
  CartResponseEntity cartResponseEntity ;
  AddToCartSuccessState({required this.cartResponseEntity});
}

class AddToCartErrorState extends Categorytabstates {
  Faliures error;
  AddToCartErrorState({required this.error});
}