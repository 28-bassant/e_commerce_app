import 'package:e_commerce_app/features/ui/home_screen/tabs/list_widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
         crossAxisSpacing: 16,
        childAspectRatio: 0.57
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductItem();
      },);
  }
}
