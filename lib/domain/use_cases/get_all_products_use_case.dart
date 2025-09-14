import 'package:e_commerce_app/domain/entities/response/product.dart';
import 'package:e_commerce_app/domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetAllProductsUseCase{
  final ProductRepository productRepository;
  GetAllProductsUseCase({required this.productRepository});

  Future<List<Product>?> invoke(){
    return productRepository.getAllProducts();
  }

}