import 'package:e_commerce_app/api/mapper/auth_response_mapper.dart';
import 'package:e_commerce_app/api/mapper/login_request_mapper.dart';
import 'package:e_commerce_app/api/mapper/register_request_mapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  WebServices webServices;
  AuthRemoteDataSourceImpl({
    required this.webServices
});

  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async{
    //todo: LoginRequestDto => LoginRequest
   var authResponse = await webServices.login(loginRequest.toLoginRequest());
   //todo: AuthResponse => AuthResponseDto
   return authResponse.toAuthResponseDto();
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) async{
    //todo: RegisterRequestDto => Register Request_request
   var authResponse = await webServices.register(registerRequest.toRegisterRequest());
   //todo: AuthResponse => AuthResponseDto
   return authResponse.toAuthResponseDto();
  }

}