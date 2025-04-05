import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:ecommerce/core/api/apiManager.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/data/modle/get_cart_modle.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/CartDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Cartdatasource)
class Cartdatasourceimpl extends Cartdatasource {
  Apimanager apimanager;
  Cartdatasourceimpl({required this.apimanager});
  @override
  Future<Either<Faliures, GetCartModle>> GetCartItems() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apimanager.getData(

          endPoint: Apiconstatnts.addToCartEndPoint ,
          headers:{
            'token': Shearedprefrencesutils.getData(key:Shearedprefrencesutils.token )
          }
          );

        var GetCartRersponse = GetCartModle.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(GetCartRersponse);
        } else {
          return left(ServerError(errorMsg: GetCartRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }
}
