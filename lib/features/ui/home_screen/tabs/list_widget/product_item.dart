import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatefulWidget {
   ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 4.h
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2
        ),

      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CachedNetworkImage(
                width: 200,
                height: 200,
                imageUrl:
                "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg",                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                Center(
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: const CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              InkWell(
                onTap: () {
                  //todo: Add to Favourite
                  isFavourite = !(isFavourite);
                  setState(() {

                  });
                },
                  child: Image.asset(isFavourite ? AppAssets.selectedFavIcon : AppAssets.unSelectedFavIcon))

            ],
          ),
          SizedBox(height: 2.h,),
          Text('Nike Air JordonNike shoes flexible for wo..',style: AppStyles.regular14Black,),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text('EGP 1,200 ',style: AppStyles.regular14Black,),
              SizedBox(width: 8.w,),
              Text('2000 EGP',style: AppStyles.regular11PrimaryWithOpacity)
            ],
          ),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Review (4.6)',style: AppStyles.regular12Black,),
                  SizedBox(width: 2.w,),
                  Image.asset(AppAssets.rateIcon),
                ],
              ),
              InkWell(
                onTap: () {
                  //todo: Add to cart
                },
                child: Image.asset(AppAssets.addIcon),
              )
              

            ],
          )


        ],
      ),
          );
  }
}
