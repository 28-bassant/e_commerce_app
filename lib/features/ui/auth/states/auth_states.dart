import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response_dto.dart';

sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  AuthResponseDto authResponse;
  AuthSuccessState({required this.authResponse});
}

class AuthErrorState extends AuthStates {
  String message;
  AuthErrorState({required this.message});
}
