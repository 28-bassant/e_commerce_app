import 'package:e_commerce_app/api/model/request/login_request.dart';

import '../../domain/entities/request/login_request_dto.dart';

extension LoginRequestMapper on LoginRequestDto{
  LoginRequest toLoginRequest(){
    return LoginRequest(
      email: email,
      password: password
    );
  }
}