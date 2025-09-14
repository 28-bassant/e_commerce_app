import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_assets.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  ProductTabViewModel({required this.getAllProductsUseCase}):super(ProductLoadingState());

  void getAllProducts()async{
  try{
    emit(ProductLoadingState());
    var productsList = await getAllProductsUseCase.invoke();
    emit(ProductSuccessState(productsList: productsList));
  }on AppException catch(e){
    emit(ProductErrorState(message: e.message));
  }

  }

}