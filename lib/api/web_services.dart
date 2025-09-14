import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_endpoints.dart';
import 'package:e_commerce_app/api/model/request/register_request.dart';
import 'package:e_commerce_app/api/model/response/auth_response.dart';
import 'package:e_commerce_app/api/model/response/category/category_response_dto.dart';
import 'package:e_commerce_app/api/model/response/products/products_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

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



}
