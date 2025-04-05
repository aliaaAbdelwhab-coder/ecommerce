import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/cart_response_entity.dart';
import 'package:ecommerce/domain/repositories/home/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Addtocartusecase {
  Homerepository homerepository;
  Addtocartusecase({required this.homerepository});
  Future<Either<Faliures, CartResponseEntity>> invok(String productId) {
    return homerepository.addToCart(productId);
  }
}
