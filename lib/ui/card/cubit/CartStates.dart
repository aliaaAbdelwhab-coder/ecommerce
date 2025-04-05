import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';

abstract class Cartstates  {}
class CartLoadingState extends Cartstates {}

class CartSuccessState extends Cartstates {
  GetCartEntity cartResponseEntity;
  CartSuccessState({required this.cartResponseEntity});
}

class CartErrorState extends Cartstates {
  Faliures error;
  CartErrorState({required this.error});
}
