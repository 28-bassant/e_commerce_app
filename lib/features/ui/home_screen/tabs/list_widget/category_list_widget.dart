import 'package:e_commerce_app/features/ui/home_screen/tabs/list_widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ItemWidget();
        },
      ),
    );
  }
}
