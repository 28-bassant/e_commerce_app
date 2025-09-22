import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AddItemCustomWidget extends StatelessWidget {
  const AddItemCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 8.w
      ),
      width: 122.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.add_circle_outline_outlined,color: AppColors.whiteColor,),
          Text('1',style: AppStyles.medium18White,),
          Icon(Icons.remove_circle_outline_outlined,color: AppColors.whiteColor,)
        ],
      ),
    );
  }
}
