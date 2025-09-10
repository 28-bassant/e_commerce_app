import 'package:e_commerce_app/api/mapper/user_mapper.dart';
import 'package:e_commerce_app/api/model/response/auth_response.dart';
import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponse{
  AuthResponseDto toAuthResponseDto(){
    if(user != null && token!.isNotEmpty && token != null){
      return AuthResponseDto(
          userDto: user!.toUserDto(),
          token: token
      );
    }
    throw ServerException(message: 'Failed Authentication');
  }
}