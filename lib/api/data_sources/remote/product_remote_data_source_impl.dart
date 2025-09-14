import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/mapper/product_mapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/core/exceptions/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/product_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  WebServices webServices;
  ProductRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      var productResponse = await webServices.getAllProducts();
      //todo: ProductDto => Product
      return productResponse.data
              ?.map((productDto) => productDto.toProduct())
              .toList() ??[];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
