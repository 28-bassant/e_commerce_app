import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/get_cart.dart';
import 'package:e_commerce_app/domain/entities/response/get_products.dart';
import 'package:e_commerce_app/features/ui/widgets/add_item_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final GetProducts getProducts;
  CartItem({required this.getProducts});

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
          ImageCart(imageCover: getProducts.product?.imageCover ?? ''),
          SizedBox(width: 8.w),
          Expanded( // make content flexible
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: getProducts.product?.title ?? ''),
                SizedBox(height: 8.h),
                ColorWidget(),
                SizedBox(height: 8.h),
                PriceWidget(price: getProducts.price ?? 0),
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

  Widget TitleWidget({required String title}) {
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

  Widget PriceWidget({required int price}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'EGP $price',
            style: AppStyles.medium18PrimaryDark,
          ),
        ),
        AddItemCustomWidget(),
      ],
    );
  }
}
