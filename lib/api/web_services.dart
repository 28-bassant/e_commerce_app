import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_endpoints.dart';
import 'package:e_commerce_app/api/model/request/register_request.dart';
import 'package:e_commerce_app/api/model/response/auth_response.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/category/category_response_dto.dart';
import 'package:e_commerce_app/api/model/response/products/products_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/request/add_product_request_dto.dart';
import 'model/request/count_request_dto.dart';
import 'model/request/login_request.dart';
import 'model/response/brands/brand_response_dto.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndPoints.loginApi)
 Future<AuthResponse> login(@Body() LoginRequest loginRequest);

   @POST(ApiEndPoints.registerApi)
 Future<AuthResponse> register(@Body() RegisterRequest registerRequest);

   @GET(ApiEndPoints.categoriesApi)
   Future<CategoryResponseDto> getAllCategories();

   @GET(ApiEndPoints.brandsApi)
   Future<BrandResponseDto> getAllBrands();

   @GET(ApiEndPoints.productsApi)
   Future<ProductsResponseDto> getAllProducts();

   @POST(ApiEndPoints.addToCartApi)
   Future<AddCartResponseDto> addToCart(
       @Body() AddProductRequestDto productRequest,
       @Header('token') String token
       );

   @GET(ApiEndPoints.addToCartApi)
   Future<GetCartResponseDto> getItemsInCart(
       @Header('token') String token
       );

   
   @DELETE(ApiEndPoints.deleteCartApi)
   Future<GetCartResponseDto> deleteItemsInCart(
       @Path() String productId,
       @Header('token') String token
       );

   @PUT(ApiEndPoints.deleteCartApi)
   Future<GetCartResponseDto> updateCountInCart(
       @Path() String productId,
       @Header('token') String token,
       @Body() CountRequestDto countRequest
       );



}
