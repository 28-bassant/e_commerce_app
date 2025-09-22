import 'package:e_commerce_app/domain/entities/response/get_products.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exception.dart';

@injectable
class CartViewModel extends Cubit<CartStates>{
  AddToCartUseCase addToCartUseCase;
  GetItemsInCartUseCase getItemsInCartUseCase;
  CartViewModel({required this.addToCartUseCase,
  required this.getItemsInCartUseCase
  }):super(CartInitialState());

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);


  int  numOfCartItems = 0;
  List<GetProducts> productsList = [];

  Future<void> addToCart(String productId)async{
    try{
      emit(AddCartLoadingState());
      var addCartResponse = await addToCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      print('NumOfCartItems  : $numOfCartItems');
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems ));
    }on AppException catch(e){
      emit(AddCartErrorState(message: e.message));
    }

  }



   Future<void> getItemsInCart()async{
    try{
      emit(GetCartLoadingState());
      var getCartResponse = await getItemsInCartUseCase.invoke();
       numOfCartItems = getCartResponse.numOfCartItems ?? 0;
      productsList = getCartResponse.data!.products ?? [];
      emit(GetCartSuccessState(getCart: getCartResponse.data!));
    }on AppException catch(e){
      emit(GetCartErrorState(message: e.message));
    }

  }

}
