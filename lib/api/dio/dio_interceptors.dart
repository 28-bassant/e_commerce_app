import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exceptions/app_exception.dart';

class DioInterceptors extends Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;
    final responseData = err.response?.data;
    String message = 'Something went wrong';
    if(responseData is Map){
      message = (responseData['errors']?['msg'] as String? ) ??
          (responseData['message'] as String?) ??
           message;
    }
    if(err.type == DioExceptionType.connectionError ||
    err.type == DioExceptionType.connectionTimeout){
      exception = NetworkException(message: 'No internet Connection');
    }else if(err.response?.statusCode !=null){
      exception = ServerException(message: message,
       statusCode: err.response?.statusCode
      );
    }else{
      exception = UnExpectedException(message: message);
    }
    handler.reject(DioException(
        requestOptions: err.requestOptions,
        error: exception
    ));
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}