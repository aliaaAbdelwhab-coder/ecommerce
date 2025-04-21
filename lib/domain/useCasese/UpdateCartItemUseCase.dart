import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';
import 'package:ecommerce/domain/repositories/CartRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Updatecartitemusecase {
  Cartrepository cartrepository;
  Updatecartitemusecase({required this.cartrepository});
Future <Either<Faliures ,GetCartEntity >>   invok(String itemID , int count) {
    return cartrepository.updateCartItem(itemID , count);
  }
}
