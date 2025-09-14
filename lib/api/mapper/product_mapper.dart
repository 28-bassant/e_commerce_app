import 'package:e_commerce_app/api/mapper/category_mapper.dart';
import 'package:e_commerce_app/api/mapper/sub_category_mapper.dart';
import 'package:e_commerce_app/api/model/response/products/product_dto.dart';
import 'package:e_commerce_app/domain/entities/response/product.dart';


extension ProductMapper on ProductDto{
  Product toProduct(){
    return Product(
      slug: slug,
      id:id ,
      title:title ,
      description: description,
      brand: brand?.toCategory(),
      category: category?.toCategory(),
      createdAt: createdAt,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity:quantity ,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory?.map((e) => e.toSubCategory(),).toList(),
      updatedAt: updatedAt

    );
  }
}