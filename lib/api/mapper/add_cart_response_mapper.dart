import 'package:e_commerce_app/api/mapper/add_cart_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/common/category_dto.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';


extension AddCartResponseMapper on AddCartResponseDto{
  AddCartResponse toAddCartResponse(){
    return AddCartResponse(
      cartId: cartId,
      data: data!.toAddCart(),
      message: message,
      numOfCartItems: numOfCartItems,
      status: status
    );
  }
}