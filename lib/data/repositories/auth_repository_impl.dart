import 'package:e_commerce_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response_dto.dart';
import 'package:e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource
});

  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }
  
}