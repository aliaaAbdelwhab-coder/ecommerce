import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/domain/repositories/home/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class Getallbrandsusecase {
  Homerepository homerepository;
  Getallbrandsusecase({required this.homerepository});
  Future<Either<Faliures, CategoryAndBrandsResponseEntity>> invok() {
    return homerepository.getAllBrands();
  }
}