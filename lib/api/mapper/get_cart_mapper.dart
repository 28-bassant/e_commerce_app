import 'package:e_commerce_app/api/mapper/get_products_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_dto.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart.dart';


extension GetCartMapper on GetCartDto{
  GetCart toGetCart(){
    return GetCart(
      id: id,
      v: v,
      totalCartPrice: totalCartPrice,
      products: products?.map((getProductsDto)=>getProductsDto.toGetProducts()).toList(),
      cartOwner: cartOwner,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}