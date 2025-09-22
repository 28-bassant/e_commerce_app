import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/toast_utils.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/widgets/product_item.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
   ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartViewModel,CartStates>(
      listener: (context, state) {
        if(state is AddCartSuccessState){
           ToastUtils.ShowToast(
              msg: 'Item Added Successfully',
               bgColor: AppColors.greenColor,
               textColor: AppColors.whiteColor,
               );
        }else if(state is AddCartErrorState){
          ToastUtils.ShowToast(
              msg: state.message,
              bgColor: AppColors.redColor,
              textColor: AppColors.whiteColor);
        }
      },
      child: BlocBuilder<ProductTabViewModel,ProductTabStates>(
          bloc: viewModel,
          builder: (context, state) {
            if(state is ProductErrorState){
              return MainErrorWidget(errorMsg: state.message,
              onTryAgain: viewModel.getAllProducts,);
            }
            else if(state is ProductSuccessState){
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.56
                ),
                itemCount: state.productsList?.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: state.productsList![index],);
                },);
            }
            else{
              return MainLoadingWidget();
            }
          },),
    );
  }
}
