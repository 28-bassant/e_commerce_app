
import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/favourite_tab/favourite_tab.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image(image: AssetImage(AppAssets.routeTitle)),
          ),
          body:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                viewModel.selectedIndex != 3?
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(hintText: 'what do you search for?',
                        hintStyle: AppStyles.light14Black,
                        prefixIcon: ImageIcon(AssetImage(AppAssets.searchIcon),color: AppColors.primaryColor,),
                        borderColor: AppColors.primaryColor,
                        borderRadius: 25,
                      ),

                    ),
                    SizedBox(width: 25.w,),
                    Badge(
                      backgroundColor: AppColors.greenColor,
                      textColor: AppColors.whiteColor,
                      label: Text('5'),
                      child: ImageIcon(AssetImage(AppAssets.shoppingCartIcon),
                        color: AppColors.primaryColor,
                        size: 35,
                      ),
                    )
                  ],
                ):
                Container()
                ,
                SizedBox(height: 16.h,),

                Expanded(child: viewModel.tabs[viewModel.selectedIndex]),

              ],
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: SizedBox(
              height: 78.h,
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                backgroundColor: AppColors.primaryColor,
                type: BottomNavigationBarType.fixed,
                iconSize: 24.sp,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  setState(() {
                    viewModel.selectedIndex = index;
                  });
                },
                items: [
                  builtBottomNavigationBarItem(
                    SelectedImageIcon: AppAssets.selectedHomeTabIcon,
                    unSelectedImageIcon: AppAssets.unSelectedHomeTabIcon,
                    label: '',
                    index: 0,
                  ),
                  builtBottomNavigationBarItem(
                    SelectedImageIcon: AppAssets.selectedProductsTabIcon,
                    unSelectedImageIcon: AppAssets.unSelectedProductsTabIcon,
                    label: '',
                    index: 1,
                  ),
                  builtBottomNavigationBarItem(
                    SelectedImageIcon: AppAssets.selectedFavouriteTabIcon,
                    unSelectedImageIcon: AppAssets.unSelectedFavouriteTabIcon,
                    label: '',
                    index: 2,
                  ),
                  builtBottomNavigationBarItem(
                    SelectedImageIcon: AppAssets.selectedProfileTabIcon,
                    unSelectedImageIcon: AppAssets.unSelectedProfileTabIcon,
                    label: '',
                    index: 3,
                  ),
                ],
              ),
            ),
          ),

        );
      },
    );

  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String SelectedImageIcon,
    required String unSelectedImageIcon,
    required int index,
    required String label,
  }) {
    bool isSelected = viewModel.selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(3.w), // smaller padding
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          isSelected ? SelectedImageIcon : unSelectedImageIcon,
          width: 30.w,
          height: 30.w,
          color: isSelected ? AppColors.primaryColor : Colors.white,
        ),
      ),
      label: label,
    );
  }

}
