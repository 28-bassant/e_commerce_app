import 'package:e_commerce_app/domain/entities/response/get_cart.dart';

sealed class CartStates{}
class CartInitialState extends CartStates{}
class AddCartSuccessState extends CartStates{
  int numOfCartItems;
  AddCartSuccessState({required this.numOfCartItems});
}
class AddCartErrorState extends CartStates{
  String message;
  AddCartErrorState({required this.message});
}
class AddCartLoadingState extends CartStates{}



class GetCartSuccessState extends CartStates{
  GetCart getCart;
  String? message;
  GetCartSuccessState({required this.getCart,this.message});
}
class GetCartErrorState extends CartStates{
  String message;
  GetCartErrorState({required this.message});
}
class GetCartLoadingState extends CartStates{}


class DeleteCartSuccessState extends CartStates{
  GetCart getCart;
  DeleteCartSuccessState({required this.getCart});
}
class DeleteCartErrorState extends CartStates{
  String message;
  DeleteCartErrorState({required this.message});
}
class DeleteCartLoadingState extends CartStates{}


class UpdateCartSuccessState extends CartStates{
  GetCart getCart;
  UpdateCartSuccessState({required this.getCart});
}
class UpdateCartErrorState extends CartStates{
  String message;
  UpdateCartErrorState({required this.message});
}
class UpdateCartLoadingState extends CartStates{}