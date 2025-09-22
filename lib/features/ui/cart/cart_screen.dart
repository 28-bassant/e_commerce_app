import 'package:e_commerce_app/features/ui/cart/cart_item.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/cart_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../widgets/custom_elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getItemsInCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,

        ),
        title: Text('Cart',style: AppStyles.medium20PrimaryDark,),
        centerTitle: true,
        actions: [
          ImageIcon(AssetImage(AppAssets.searchIcon)),
          SizedBox(width: 20.w,),
          CartWidget(),
          SizedBox(width: 16.w,),

        ],
      ),
      body: BlocBuilder<CartViewModel,CartStates>(
        builder: (context, state) {
          if(state is GetCartErrorState){
            return MainErrorWidget(errorMsg: state.message);
          }else if(state is GetCartSuccessState){
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(getProducts: state.getCart.products![index],);
                      },

                      itemCount: state.getCart.products!.length
                  ),
                ),
                SizedBox(height: 24.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Total Price',style: AppStyles.medium18PrimaryDark,),
                          Text('EGP ${state.getCart.totalCartPrice}',style: AppStyles.medium18Black,),
                        ],
                      ),
                      SizedBox(width: 16.w,),
                      Expanded(
                        child: CustomElevatedButton(
                          text: 'Checkout',
                          borderReadius: 34,
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () {
                            //todo: Checkout
                          },

                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }else{
            return MainLoadingWidget();
          }
        },


      ),

    );
  }
}
