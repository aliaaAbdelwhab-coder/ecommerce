import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Regester/data/modle/RegisterResponseDM.dart';
import 'package:ecommerce/Regester/domain/repositories/dataSource/remoteDataSource/registerRemoteDataSource.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:ecommerce/core/api/apiManager.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:Registerremotedatasource )
class Registerdatasourceimpl extends Registerremotedatasource {
  Apimanager apimanager;
  Registerdatasourceimpl({required this.apimanager});
  @override
  Future<Either<Faliures, RegisterResponseDM>> register(String name,
      String email, String password, String repassword, String phone) async {
  try{      
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

      var registerRersponse = RegisterResponseDM.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return right(registerRersponse);
      } else {
        return left(ServerError(errorMsg: registerRersponse.message!));
      }
    } else {
    return  left(NetworkError(errorMsg: "no internet connection"));
    }}
    catch(e){
      return  left(ServerError(errorMsg: e.toString()));     
    }
  }
}
