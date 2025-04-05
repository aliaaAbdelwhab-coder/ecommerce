import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';
import 'package:ecommerce/domain/repositories/home/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Getproductsusecase {
  Homerepository homerepository;
  Getproductsusecase(this.homerepository);
  Future<Either<Faliures, ProductResponseEntity>> invok() {
    return homerepository.getAllProducts();
  }
}
