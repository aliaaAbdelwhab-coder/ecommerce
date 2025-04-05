import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';

abstract  class Cartrepository  {
   Future <Either <Faliures , GetCartEntity>> GetCartItems ();
}