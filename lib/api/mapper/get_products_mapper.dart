import 'package:e_commerce_app/api/mapper/add_product_mapper.dart';
import 'package:e_commerce_app/api/mapper/product_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_products_dto.dart';
import 'package:e_commerce_app/api/model/response/common/category_dto.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart.dart';
import 'package:e_commerce_app/domain/entities/response/get_products.dart';


extension GetProductsMapper on GetProductsDto{
  GetProducts toGetProducts(){
    return GetProducts(
      id: id,
      product: product?.toProduct(),
      count: count,
      price: price
    );
  }
}