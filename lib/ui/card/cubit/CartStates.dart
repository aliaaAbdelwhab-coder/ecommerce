import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';

abstract class Cartstates  {}
class CartLoadingState extends Cartstates {}

class CartSuccessState extends Cartstates {
  GetCartEntity cartResponseEntity;
  CartSuccessState({required this.cartResponseEntity});
}
class deleteCartItmeSuccessState extends Cartstates {
  GetCartEntity cartResponseEntity;
  deleteCartItmeSuccessState({required this.cartResponseEntity});
}
class CartErrorState extends Cartstates {
  Faliures error;
  CartErrorState({required this.error});
}
class deleteCartItmeErrorState extends Cartstates {
  Faliures error;
  deleteCartItmeErrorState({required this.error});
}
class UpdateCartItmeErrorState extends Cartstates {
  Faliures error;
  UpdateCartItmeErrorState({required this.error});
}
class UpdateCartItmeSuccessState extends Cartstates {
  GetCartEntity cartResponseEntity;
  UpdateCartItmeSuccessState({required this.cartResponseEntity});
}