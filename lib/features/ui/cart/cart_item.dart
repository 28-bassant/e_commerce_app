import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart.dart';
import 'package:e_commerce_app/domain/entities/response/get_products.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/add_item_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  final GetProducts getProducts;
  CartItem({required this.getProducts});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.only(top: 4.h),
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary30Opacity,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          ImageCart(imageCover: widget.getProducts.product?.imageCover ?? ''),
          SizedBox(width: 8.w),
          Expanded( // make content flexible
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: widget.getProducts.product?.title ?? '',
                productId: widget.getProducts.product?.id ?? ''),
                SizedBox(height: 8.h),
                ColorWidget(),
                SizedBox(height: 8.h),
                PriceWidget(price: widget.getProducts.price ?? 0,
                count: widget.getProducts.count ?? 0,
                onPressedIncrement: () {
                  //todo : Increment Count
                  int count = widget.getProducts.count!;

                    count ++;
                    setState(() {

                    });
                    CartViewModel.get(context).updateCountInCart(
                        widget.getProducts.product?.id ?? '',
                        count);

                },
                onPressedDecrement: () {
                  //todo : Decrement Count
                  int count = widget.getProducts.count!;
                  if(count > 1){
                    count --;
                    setState(() {

                    });
                    CartViewModel.get(context).updateCountInCart(
                        widget.getProducts.product?.id ?? '',
                        count);
                  }


                },),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ImageCart({required String imageCover}) {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary30Opacity,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageCover,
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget TitleWidget({required String title,required String productId}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.medium18PrimaryDark,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        InkWell(
          onTap: () {
            // todo: delete item from cart
            CartViewModel.get(context).deleteItemsInCart(productId);
          },
          child: ImageIcon(
            AssetImage(AppAssets.deleteIcon),
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }

  Widget ColorWidget() {
    return Row(
      children: [
        Image.asset(AppAssets.orangeColor, width: 20),
        SizedBox(width: 8.w),
        Text(
          'Orange  Size: 40',
          style: AppStyles.regular14PrimaryDarkWithOpacity,
        ),
      ],
    );
  }

  Widget PriceWidget({required int price,
  required int count,
  required VoidCallback onPressedIncrement,
  required VoidCallback onPressedDecrement,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'EGP $price',
            style: AppStyles.medium18PrimaryDark,
          ),
        ),
        AddItemCustomWidget(
            count: count,
            onPressedDecrement: onPressedDecrement,
             onPressedIncrement: onPressedIncrement,
        ),
      ],
    );
  }
}
