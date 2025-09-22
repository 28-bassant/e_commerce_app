
import 'package:e_commerce_app/domain/entities/response/get_products.dart';

class GetCart {
  final String? id;
  final String? cartOwner;
  final List<GetProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetCart ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

}
