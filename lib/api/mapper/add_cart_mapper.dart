import 'package:e_commerce_app/api/mapper/add_product_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/common/category_dto.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';


extension AddCartMapper on AddCartDto{
  AddCart toAddCart(){
    return AddCart(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      cartOwner: cartOwner,
      products: products?.map((addProductDto) =>addProductDto.toAddProduct() ,).toList(),
      totalCartPrice: totalCartPrice,
      v: v
    );
  }
}