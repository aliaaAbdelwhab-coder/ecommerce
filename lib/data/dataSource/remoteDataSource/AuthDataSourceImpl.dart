import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:ecommerce/core/api/apiManager.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/data/modle/AuthResponseDM.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/AuthRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class Authdatasourceimpl extends AuthRemoteDataSource {
  Apimanager apimanager;
  Authdatasourceimpl({required this.apimanager});
  @override
  Future<Either<Faliures, AuthResponseDM>> register(String name, String email,
      String password, String repassword, String phone) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apimanager
            .postData(endPoint: Apiconstatnts.registerEndPoint, data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": repassword,
          "phone": phone
        });

        var registerRersponse = AuthResponseDM.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return right(registerRersponse);
        } else {
          return left(ServerError(errorMsg: registerRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, AuthResponseDM>> login(
      String email, String password) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apimanager
            .postData(endPoint: Apiconstatnts.loginEndPoint, data: {
          "email": email,
          "password": password,
        });
        var loginRersponse = AuthResponseDM.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          
          return right(loginRersponse);
        } else {
          return left(ServerError(errorMsg: loginRersponse.message!));
        }
      } else {
        return left(NetworkError(errorMsg: "no internet connection"));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }
}
