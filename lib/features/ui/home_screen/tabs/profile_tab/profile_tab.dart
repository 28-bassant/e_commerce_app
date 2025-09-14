import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome, Mohamed',style: AppStyles.medium18Black,),
          Text('mohamed.N@gmail.com',style: AppStyles.medium14PrimaryDark,),
          SizedBox(height: 40.h,),
          Text('Your full name',style: AppStyles.medium18Black,),
          SizedBox(height: 16.h,),
          CustomTextFormField(hintText: 'Mohamed Mohamed Nabil',
          hintStyle: AppStyles.medium14Black,
            suffixIcon: ImageIcon(AssetImage(AppAssets.editIcon)),
            borderColor: AppColors.primary30Opacity,
          ),
          SizedBox(height: 24.h,),
          Text('Your E-mail',style: AppStyles.medium18Black,),
          SizedBox(height: 16.h,),
          CustomTextFormField(hintText: 'mohamed.N@gmail.com',
            hintStyle: AppStyles.medium14Black,
            suffixIcon: ImageIcon(AssetImage(AppAssets.editIcon)),
            borderColor: AppColors.primary30Opacity,
          ),
          SizedBox(height: 24.h,),
          Text('Your password',style: AppStyles.medium18Black,),
          SizedBox(height: 16.h,),
          CustomTextFormField(hintText: '***********',
            hintStyle: AppStyles.medium14Black,
            suffixIcon: ImageIcon(AssetImage(AppAssets.editIcon)),
            borderColor: AppColors.primary30Opacity,
          ),
          SizedBox(height: 24.h,),
          Text('Your mobile number',style: AppStyles.medium18Black,),
          SizedBox(height: 16.h,),
          CustomTextFormField(hintText: '01122118855',
            hintStyle: AppStyles.medium14Black,
            suffixIcon: ImageIcon(AssetImage(AppAssets.editIcon)),
            borderColor: AppColors.primary30Opacity,
          ),
          SizedBox(height: 24.h,),
          Text('Your Address',style: AppStyles.medium18Black,),
          SizedBox(height: 16.h,),
          CustomTextFormField(hintText: '6th October, street 11.....',
            hintStyle: AppStyles.medium14Black,
            suffixIcon: ImageIcon(AssetImage(AppAssets.editIcon)),
            borderColor: AppColors.primary30Opacity,
          ),
      
      
      
        ],
      ),
    );
  }
}
