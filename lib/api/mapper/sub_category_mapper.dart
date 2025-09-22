import 'package:e_commerce_app/domain/entities/response/sub_category.dart';

import '../model/response/common/sub_category_dto.dart';


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