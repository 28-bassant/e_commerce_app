import 'package:e_commerce_app/domain/entities/response/metadata.dart';
import 'package:e_commerce_app/domain/entities/response/product.dart';


class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductsResponse ({
    this.results,
    this.metadata,
    this.data,
  });


}



