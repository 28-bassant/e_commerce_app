import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/list_widget/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
  List<String> adsImagesList = [
    AppAssets.adImage1,
    AppAssets.adImage2,
    AppAssets.adImage3,
  ] ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnnouncement(adsImagesList),
          SizedBox(height: 24.h,),
          _lineBreak(text: 'Categories',text2: 'view all'),
          SizedBox(height: 16.h,),
          CategoryListWidget(),
          SizedBox(height: 16.h,),
          _lineBreak(text: 'Brands',text2: 'view all'),
          SizedBox(height: 16.h,),
          CategoryListWidget(),




        ],
      ),
    );
  }



ImageSlideshow _buildAnnouncement(
    List<String> adsImagesList
    ){
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        isLoop: true,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        autoPlayInterval: 3000,
        height: 190.h,
        children: adsImagesList.map((e) {
          return Image.asset(e,
          fit: BoxFit.fill,);
        },).toList());
}
Row _lineBreak({
     required String text,
     String? text2
}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.medium18Black,),
        Text(text2 ?? '',style: AppStyles.regular12Black,),

      ],
    );
}
}
