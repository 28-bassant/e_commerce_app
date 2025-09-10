import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_endpoints.dart';
import 'package:e_commerce_app/api/model/request/register_request.dart';
import 'package:e_commerce_app/api/model/response/auth_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'model/request/login_request.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndPoints.loginApi)
 Future<AuthResponse> login(@Body() LoginRequest loginRequest);

   @POST(ApiEndPoints.registerApi)
 Future<AuthResponse> register(@Body() RegisterRequest registerRequest);


}
