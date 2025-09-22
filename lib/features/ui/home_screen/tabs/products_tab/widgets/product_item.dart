import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domain/entities/response/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo: Navigate to Product Details
        Navigator.pushNamed(context, AppRoutes.productRoute,
        arguments: widget.product);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary30Opacity,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.product.imageCover ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() => isFavourite = !isFavourite);
                    },
                    child: Image.asset(
                      isFavourite
                          ? AppAssets.selectedFavIcon
                          : AppAssets.unSelectedFavIcon,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              widget.product.title ?? '',
              style: AppStyles.regular14Black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
       Text(
              widget.product.description ?? '',
              style: AppStyles.regular14Black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 8.h),

            Row(
              children: [
                Text(
                  'EGP ${widget.product.price}',
                  style: AppStyles.regular14Black,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${(widget.product.price)! * 2} EGP',
                  style: AppStyles.regular11PrimaryWithOpacity,
                ),
              ],
            ),

            SizedBox(height: 8.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Review (${widget.product.ratingsQuantity})',
                      style: AppStyles.regular12Black,
                    ),
                    SizedBox(width: 2.w),
                    Image.asset(AppAssets.rateIcon),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // todo: Add to cart
                    CartViewModel.get(context).addToCart(widget.product.id ?? '');
                  },
                  child: Image.asset(AppAssets.addIcon),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
