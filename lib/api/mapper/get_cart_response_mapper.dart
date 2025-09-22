import 'package:e_commerce_app/api/mapper/get_cart_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_response_dto.dart';

import 'package:e_commerce_app/domain/entities/response/get_cart_response.dart';


extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
        numOfCartItems: numOfCartItems,
        status: status,
        data: data?.toGetCart(),
        cartId: cartId
    );
  }
}