import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:injectable/injectable.dart';
@singleton
class Apimanager {
  final dio = Dio();

  Future<Response> getData({Map<String, dynamic>? queryParameters ,Options? options ,
  required String endPoint  , Map<String, dynamic>? headers
  }) {
    return dio.get(Apiconstatnts.baseURl + endPoint,
    queryParameters:queryParameters ,options:Options(validateStatus: (status)=>true,
    headers: headers
    ),
    );
  }
  Future<Response> postData({Map<String, dynamic>? queryParameters ,Options? options ,
  required String endPoint  ,Object? data ,Map<String, dynamic>? headers
  }) {
    return dio.post(Apiconstatnts.baseURl + endPoint,
    queryParameters:queryParameters , options:Options(validateStatus: (status)=>true ,
    headers: headers
     ) ,data: data
    );
  }

}
