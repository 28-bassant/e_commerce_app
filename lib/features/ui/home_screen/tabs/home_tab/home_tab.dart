import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_widget/category_list_widget.dart';

class HomeTab extends StatefulWidget {
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnnouncement(viewModel.adsImagesList),
          SizedBox(height: 24.h,),
          _lineBreak(text: 'Categories'),
          SizedBox(height: 16.h,),
          BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel,
              builder:(context, state) {
                if(state is CategoryErrorState){
                return MainErrorWidget(errorMsg: state.message,
                onTryAgain: () => viewModel.getAllCategories(),);
                }
                else if(state is HomeTabSuccessState){
                   return CategoryListWidget(categoriesList: state.categoriesList ?? [],);
                }
                else{
                  return MainLoadingWidget();
                }
              },
          ),
          SizedBox(height: 16.h,),
          _lineBreak(text: 'Brands'),
          SizedBox(height: 16.h,),
          BlocBuilder<HomeTabViewModel,HomeTabStates>(
            bloc: viewModel,
            builder:(context, state) {
              if(state is BrandErrorState){
                return MainErrorWidget(errorMsg: state.message,
                  onTryAgain: () => viewModel.getAllBrands(),);
              }
              else if(state is HomeTabSuccessState){
                return CategoryListWidget(categoriesList: state.brandsList ?? [],);
              }
              else{
                return MainLoadingWidget();
              }
            },
          ),




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
}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.medium18Black,),
        InkWell(
            onTap: () {
              //todo: Navigate to all
            },
            child: Text('View All',style: AppStyles.regular12Black,)),

      ],
    );
}
}
