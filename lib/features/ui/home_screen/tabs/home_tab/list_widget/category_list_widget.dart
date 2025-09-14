import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/home_tab/list_widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListWidget extends StatelessWidget {
  List<Category> categoriesList;
   CategoryListWidget({super.key,required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  ItemWidget(item: categoriesList[index],);
        },
      ),
    );
  }
}
