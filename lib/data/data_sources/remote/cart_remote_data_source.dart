import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';

import '../../../domain/entities/response/get_cart_response.dart';

abstract class CartRemoteDataSource{
  Future<AddCartResponse> addToCart(String productId);
  Future<GetCartResponse> getItemsInCart();

}