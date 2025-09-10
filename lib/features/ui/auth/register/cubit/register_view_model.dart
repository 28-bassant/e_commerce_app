import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(AuthInitialState());
  //todo: hold data - handle logic
  final formKey = GlobalKey<FormState>();

  void register({required String email,required String password,required String name,
  required String rePassword,required String phone})async{
    if(formKey.currentState?.validate() == true){
      try{
        emit(AuthLoadingState());
        var registerRequest = RegisterRequestDto(email: email, password: password,
        rePassword: rePassword,phone: phone,name: name);
        var response = await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(authResponse: response));

      }on AppException catch(e){
        emit(AuthErrorState(message: e.message));
      }on DioException catch(e){
        final message = (e.error is AppException) ?
        (e.error as AppException).message :
            'Unexpected error occurred';
        emit(AuthErrorState(message: message));
      }
    }
  }



}