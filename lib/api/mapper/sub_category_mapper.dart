import 'package:e_commerce_app/api/model/response/products/sub_category_dto.dart';
import 'package:e_commerce_app/domain/entities/response/sub_category.dart';


extension SubCategoryMapper on SubcategoryDto{
  Subcategory toSubCategory(){
    return Subcategory(
      category: category,
      id: id,
      slug: slug,
      name: name
    );
  }
}