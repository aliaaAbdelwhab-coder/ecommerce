// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/dataSource/remoteDataSource/AuthDataSourceImpl.dart'
    as _i503;
import '../../data/dataSource/remoteDataSource/CartDataSourceImpl.dart' as _i54;
import '../../data/dataSource/remoteDataSource/homeRemoteDataSourceImpl.dart'
    as _i894;
import '../../data/repository/AuthRepositoryImpl.dart' as _i648;
import '../../data/repository/CartRepositoryMPL.dart' as _i277;
import '../../data/repository/homeRepositoryIMPl.dart' as _i784;
import '../../domain/repositories/AuthRepositiory.dart' as _i637;
import '../../domain/repositories/CartRepository.dart' as _i318;
import '../../domain/repositories/dataSource/remoteDataSource/AuthRemoteDataSource.dart'
    as _i179;
import '../../domain/repositories/dataSource/remoteDataSource/CartDataSource.dart'
    as _i355;
import '../../domain/repositories/dataSource/remoteDataSource/homeRemoteDataSource.dart'
    as _i409;
import '../../domain/repositories/home/homeRepository.dart' as _i561;
import '../../domain/useCasese/AddToCartUseCase.dart' as _i425;
import '../../domain/useCasese/deleteCartItemUseCase.dart' as _i523;
import '../../domain/useCasese/getAllBrandsUseCase.dart' as _i312;
import '../../domain/useCasese/getAllCategoryUseCase.dart' as _i593;
import '../../domain/useCasese/GetCartUseCase.dart' as _i953;
import '../../domain/useCasese/getProductsUseCase.dart' as _i978;
import '../../domain/useCasese/LoginUserCase.dart' as _i133;
import '../../domain/useCasese/RegisterUserCase.dart' as _i372;
import '../../domain/useCasese/UpdateCartItemUseCase.dart' as _i461;
import '../../ui/card/cubit/cartViewModle.dart' as _i915;
import '../../ui/categoryTab/cubit/categoryTabViewModle.dart' as _i293;
import '../../ui/homeTab/cubit/homeTabeViewModle.dart' as _i570;
import '../../ui/login/cubit/loginViewModle.dart' as _i142;
import '../../ui/Register/cubit/registerViewModle.dart' as _i939;
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
    gh.factory<_i179.AuthRemoteDataSource>(
        () => _i503.Authdatasourceimpl(apimanager: gh<_i963.Apimanager>()));
    gh.factory<_i355.Cartdatasource>(
        () => _i54.Cartdatasourceimpl(apimanager: gh<_i963.Apimanager>()));
    gh.factory<_i409.Homeremotedatasource>(() =>
        _i894.Homeremotedatasourceimpl(apimanager: gh<_i963.Apimanager>()));
    gh.factory<_i561.Homerepository>(() => _i784.Homerepositoryimpl(
        homeremotedatasource: gh<_i409.Homeremotedatasource>()));
    gh.factory<_i637.Authrepositiory>(() => _i648.AuthRepositoryimpl(
        authRemoteDataSource: gh<_i179.AuthRemoteDataSource>()));
    gh.factory<_i318.Cartrepository>(() =>
        _i277.Cartrepositorympl(cartdatasource: gh<_i355.Cartdatasource>()));
    gh.factory<_i133.Loginusercase>(() =>
        _i133.Loginusercase(authRepositiory: gh<_i637.Authrepositiory>()));
    gh.factory<_i372.Registerusercase>(() =>
        _i372.Registerusercase(authRepositiory: gh<_i637.Authrepositiory>()));
    gh.factory<_i425.Addtocartusecase>(() =>
        _i425.Addtocartusecase(homerepository: gh<_i561.Homerepository>()));
    gh.factory<_i312.Getallbrandsusecase>(() =>
        _i312.Getallbrandsusecase(homerepository: gh<_i561.Homerepository>()));
    gh.factory<_i593.Getallcategoryusecase>(() => _i593.Getallcategoryusecase(
        homerepository: gh<_i561.Homerepository>()));
    gh.factory<_i570.Hometabeviewmodle>(() => _i570.Hometabeviewmodle(
          getallcategoryusercase: gh<_i593.Getallcategoryusecase>(),
          getallbrandsusecase: gh<_i312.Getallbrandsusecase>(),
        ));
    gh.factory<_i978.Getproductsusecase>(
        () => _i978.Getproductsusecase(gh<_i561.Homerepository>()));
    gh.factory<_i939.Registerviewmodle>(() => _i939.Registerviewmodle(
        registerusercase: gh<_i372.Registerusercase>()));
    gh.factory<_i293.Categorytabviewmodle>(() => _i293.Categorytabviewmodle(
          getproductsusecase: gh<_i978.Getproductsusecase>(),
          addtocartusecase: gh<_i425.Addtocartusecase>(),
        ));
    gh.factory<_i953.Getcartusecase>(
        () => _i953.Getcartusecase(cartrepository: gh<_i318.Cartrepository>()));
    gh.factory<_i523.Deletecartitemusecase>(() => _i523.Deletecartitemusecase(
        cartrepository: gh<_i318.Cartrepository>()));
    gh.factory<_i461.Updatecartitemusecase>(() => _i461.Updatecartitemusecase(
        cartrepository: gh<_i318.Cartrepository>()));
    gh.factory<_i142.Loginviewmodle>(
        () => _i142.Loginviewmodle(loginusercase: gh<_i133.Loginusercase>()));
    gh.factory<_i915.Cartviewmodle>(() => _i915.Cartviewmodle(
          getcartusecase: gh<_i953.Getcartusecase>(),
          deletecartitemusecase: gh<_i523.Deletecartitemusecase>(),
          updatecartitemusecase: gh<_i461.Updatecartitemusecase>(),
        ));
    return this;
  }
}
