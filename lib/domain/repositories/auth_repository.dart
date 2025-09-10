import 'package:e_commerce_app/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response_dto.dart';

abstract class AuthRepository{
  Future<AuthResponseDto> login(LoginRequestDto loginRequest);
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest);
}