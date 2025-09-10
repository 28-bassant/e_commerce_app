import 'package:e_commerce_app/api/model/request/register_request.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequestDto{
  RegisterRequest toRegisterRequest(){
    return RegisterRequest(
      password: password,
      email: email,
      name: name,
      phone: phone,
      rePassword: rePassword
    );
  }
}