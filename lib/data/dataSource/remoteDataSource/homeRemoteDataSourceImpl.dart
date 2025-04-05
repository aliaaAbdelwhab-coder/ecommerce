import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:ecommerce/core/api/apiManager.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/data/modle/cart_response_dm.dart';
import 'package:ecommerce/data/modle/categoryAndBrand_response_dm.dart';
import 'package:ecommerce/data/modle/product_response_dm.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/homeRemoteDataSource.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: Homeremotedatasource)
class Homeremotedatasourceimpl extends Homeremotedatasource {
  Apimanager apimanager;
  Homeremotedatasourceimpl({required this.apimanager});
  @override
  Future<Either<Faliures, CategoryAndBrandResponseDm>>
      getAllCatepories() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apimanager.getData(
            endPoint: Apiconstatnts.getCategoryEndPoint);

        var CategoryRersponse =
            CategoryAndBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(CategoryRersponse);
        } else {
          return left(ServerError(errorMsg: CategoryRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, CategoryAndBrandResponseDm>> getAllBrands() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apimanager.getData(endPoint: Apiconstatnts.getBrandsEndPoint);

        var brandRersponse = CategoryAndBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(brandRersponse);
        } else {
          return left(ServerError(errorMsg: brandRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, ProductResponseDm>> getAllProducts() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apimanager.getData(
            endPoint: Apiconstatnts.getProductEndPoint);

        var productRersponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(productRersponse);
        } else {
          return left(ServerError(errorMsg: productRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, CartResponseDm>> addToCart(String productId) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var token = Shearedprefrencesutils.getData(key: "token");
        var response = await apimanager.postData(
            endPoint: Apiconstatnts.addToCartEndPoint,
            data: {"productId": productId},
            headers: {"token": token});

        var AddCartRersponse = CartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(AddCartRersponse);
        } else {
          return left(ServerError(errorMsg: AddCartRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }
}
