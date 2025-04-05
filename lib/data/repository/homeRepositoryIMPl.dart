import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/cart_response_entity.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/homeRemoteDataSource.dart';
import 'package:ecommerce/domain/repositories/home/homeRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Homerepository)
class Homerepositoryimpl extends Homerepository {
  Homeremotedatasource homeremotedatasource;
  Homerepositoryimpl({required this.homeremotedatasource});
  @override
  Future<Either<Faliures, CategoryAndBrandsResponseEntity>>
      getAllCatepories() async {
    var either = await homeremotedatasource.getAllCatepories();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Faliures, CategoryAndBrandsResponseEntity>>
      getAllBrands() async {
    var either = await homeremotedatasource.getAllBrands();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Faliures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeremotedatasource.getAllProducts();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Faliures, CartResponseEntity>> addToCart(String productId) async {
     var either = await homeremotedatasource.addToCart(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
