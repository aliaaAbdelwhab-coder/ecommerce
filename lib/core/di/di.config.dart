// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Regester/data/dataSource/remoteDataSource/RegisterDataSourceImpl.dart'
    as _i281;
import '../../Regester/data/repository/RegisterRepositoryImpl.dart' as _i809;
import '../../Regester/domain/repositories/dataSource/remoteDataSource/registerRemoteDataSource.dart'
    as _i487;
import '../../Regester/domain/repositories/RegisterRepositiory.dart' as _i557;
import '../../Regester/domain/useCasese/RegisterUserCase.dart' as _i107;
import '../../Regester/ui/cubit/registerViewModle.dart' as _i256;
import '../api/apiManager.dart' as _i963;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i963.Apimanager>(() => _i963.Apimanager());
    gh.factory<_i487.Registerremotedatasource>(
        () => _i281.Registerdatasourceimpl(apimanager: gh<_i963.Apimanager>()));
    gh.factory<_i557.Registerrepositiory>(() => _i809.Registerrepositoryimpl(
        registerremotedatasource: gh<_i487.Registerremotedatasource>()));
    gh.factory<_i107.Registerusercase>(() => _i107.Registerusercase(
        registerrepositiory: gh<_i557.Registerrepositiory>()));
    gh.factory<_i256.Registerviewmodle>(() => _i256.Registerviewmodle(
        registerusercase: gh<_i107.Registerusercase>()));
    return this;
  }
}
