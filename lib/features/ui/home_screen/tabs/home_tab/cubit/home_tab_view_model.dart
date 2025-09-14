import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_assets.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({required this.getAllCategoriesUseCase,
  required this.getAllBrandsUseCase}):super(HomeTabInitialState());
  //todo: hold data - handle logic
  List<String> adsImagesList = [
    AppAssets.adImage1,
    AppAssets.adImage2,
    AppAssets.adImage3,
  ] ;
 HomeTabSuccessState successState = HomeTabSuccessState();
  void getAllCategories()async{
  try{
    emit(CategoryLoadingState());
    var categoriesList = await getAllCategoriesUseCase.invoke();
    emit(successState = successState.copyWith(categoriesList: categoriesList));
  }on AppException catch(e){
    emit(CategoryErrorState(message: e.message));
  }

  }

   void getAllBrands()async{
  try{
    emit(BrandLoadingState());
    var brandsList = await getAllBrandsUseCase.invoke();
    emit(successState = successState.copyWith(brandsList: brandsList));
  }on AppException catch(e){
    emit(BrandErrorState(message: e.message));
  }

  }


}