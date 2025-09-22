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
  GetCartSuccessState({required this.getCart});
}
class GetCartErrorState extends CartStates{
  String message;
  GetCartErrorState({required this.message});
}
class GetCartLoadingState extends CartStates{}