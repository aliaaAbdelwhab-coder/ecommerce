import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';
import 'package:ecommerce/domain/repositories/CartRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Deletecartitemusecase {
  Cartrepository cartrepository;
  Deletecartitemusecase({required this.cartrepository});
  Future <Either<Faliures , GetCartEntity>>  invok(String itemID) {
    return cartrepository.DeleteCartItem(itemID);
  }
}
