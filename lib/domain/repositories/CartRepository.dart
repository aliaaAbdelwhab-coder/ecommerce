import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';

abstract  class Cartrepository  {
   Future <Either <Faliures , GetCartEntity>> GetCartItems ();
   Future <Either <Faliures , GetCartEntity>> DeleteCartItem (String itemID);
   Future <Either <Faliures , GetCartEntity>> updateCartItem (String itemID,int count);
}