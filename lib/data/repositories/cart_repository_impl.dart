import 'package:e_commerce_app/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart_response.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AddCartResponse> addToCart(String productId) {
   return remoteDataSource.addToCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    return remoteDataSource.getItemsInCart();
  }

}