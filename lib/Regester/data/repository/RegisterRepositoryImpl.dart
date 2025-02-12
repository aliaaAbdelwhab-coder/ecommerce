import 'package:dartz/dartz.dart';
import 'package:ecommerce/Regester/data/dataSource/remoteDataSource/RegisterDataSourceImpl.dart';
import 'package:ecommerce/Regester/domain/entities/register_response_entitie.dart';
import 'package:ecommerce/Regester/domain/repositories/RegisterRepositiory.dart';
import 'package:ecommerce/Regester/domain/repositories/dataSource/remoteDataSource/registerRemoteDataSource.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: Registerrepositiory)
class Registerrepositoryimpl extends Registerrepositiory {
  Registerremotedatasource registerremotedatasource;
  Registerrepositoryimpl({required this.registerremotedatasource});
  @override
  Future<Either<Faliures, RegisterResponseEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    var either = await registerremotedatasource.register(
        name, email, password, repassword, phone);
    return either.fold(
        (faliures) => left(faliures), (response) => right(response));
  }
}
