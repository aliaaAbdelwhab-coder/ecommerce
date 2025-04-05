import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/AuthResponseEntity.dart';
import 'package:ecommerce/domain/repositories/AuthRepositiory.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/AuthRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Authrepositiory)
class AuthRepositoryimpl extends Authrepositiory {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryimpl({required this.authRemoteDataSource});
  @override
  Future<Either<Faliures, AuthResponseEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, repassword, phone);
    return either.fold(
        (faliures) => left(faliures), (response) => right(response));
  }

  @override
  Future<Either<Faliures, AuthResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
