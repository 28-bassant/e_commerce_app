import 'package:e_commerce_app/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart_response.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountsInCartUseCase{
  CartRepository cartRepository;
  UpdateCountsInCartUseCase({required this.cartRepository});


  Future<GetCartResponse> invoke(String productId,int count){
    return cartRepository.updateCountInCart(productId,count);
  }
}