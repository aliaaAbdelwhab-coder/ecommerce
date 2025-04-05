import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/domain/useCasese/getAllBrandsUseCase.dart';
import 'package:ecommerce/domain/useCasese/getAllCategoryUseCase.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/homeTab/cubit/homeTabStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class Hometabeviewmodle extends Cubit<Hometabstates> {
  Getallcategoryusecase getallcategoryusercase;
  Getallbrandsusecase getallbrandsusecase;
  Hometabeviewmodle({required this.getallcategoryusercase , required this.getallbrandsusecase})
      : super(homeTabeInitialState());
  List<CategoryAndBrandDataEntity> categoryList = [];
    List<CategoryAndBrandDataEntity> brandList = [];
  getAllcategories() async {
    emit(homeTabeLoadingState());
    var either = await getallcategoryusercase.invok();
    either.fold((error) {
      emit(homeTabeErrorState(error: error));
    }, (response) {
      categoryList = response.data!;
      emit(homeTabeSuccessState(categoryResponseEntity: response));
    });
  }

  getAllBrands() async {
    emit(brandLoadingState());
    var either = await getallbrandsusecase.invok();
    either.fold((error) {
      emit(brandErrorState(error: error));
    }, (response) {
      brandList = response.data!;
      emit(brandSuccessState( categoryAndBrandsResponseEntity: response));
    });
  }
}
