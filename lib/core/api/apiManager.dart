import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/apiConstatnts.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:injectable/injectable.dart';

@singleton
class Apimanager {
  final dio = Dio();

  Future<Response> getData(
      {Map<String, dynamic>? queryParameters,
      Options? options,
      required String endPoint,
      Map<String, dynamic>? headers}) {
    return dio.get(
      Apiconstatnts.baseURl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData(
      {Map<String, dynamic>? queryParameters,
      Options? options,
      required String endPoint,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.post(Apiconstatnts.baseURl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: data);
  }
  Future<Response> deleteData(
      {Map<String, dynamic>? queryParameters,
      Options? options,
      required String endPoint,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.delete(Apiconstatnts.baseURl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: data);
  }
    Future<Response> UpdateData(
      {Map<String, dynamic>? queryParameters,
      Options? options,
      required String endPoint,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.put(Apiconstatnts.baseURl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: data);
  }
  // Future<Response> deleteData({
  //   required String endPoint,
  //   Object? data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  // }) {
  //   print(
  //       "token is : ${Shearedprefrencesutils.getData(key: Shearedprefrencesutils.token)}");
  //   return dio.delete(Apiconstatnts.baseURl + endPoint, queryParameters: {
  //     'token': Shearedprefrencesutils.getData(key: Shearedprefrencesutils.token)
  //   },options: Options(validateStatus: (status) => true),);
  // }
}
