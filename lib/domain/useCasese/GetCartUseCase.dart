import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';
import 'package:ecommerce/domain/repositories/CartRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Getcartusecase {
  Cartrepository cartrepository;
  Getcartusecase({required this.cartrepository});
Future <Either<Faliures , GetCartEntity>>  invok() {
    return cartrepository.GetCartItems();
  }
}
