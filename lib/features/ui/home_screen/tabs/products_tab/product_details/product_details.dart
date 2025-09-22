import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/product.dart';
import 'package:e_commerce_app/features/ui/widgets/add_item_custom_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/cart_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    var productArg = ModalRoute.of(context)?.settings.arguments as Product;
    List<String> images = [
      "https://ecommerce.routemisr.com/Route-Academy-products/1680403266805-1.jpeg",
      "https://ecommerce.routemisr.com/Route-Academy-products/1680403266806-3.jpeg",
      "https://ecommerce.routemisr.com/Route-Academy-products/1680403266806-2.jpeg",
      "https://ecommerce.routemisr.com/Route-Academy-products/1680403266807-4.jpeg"
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,

        ),
        title: Text('Product Details',style: AppStyles.medium20PrimaryDark,),
        centerTitle: true,
        actions: [
          ImageIcon(AssetImage(AppAssets.searchIcon)),
          SizedBox(width: 20.w,),
          CartWidget(),
          SizedBox(width: 16.w,),

        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 300.h,
            decoration: BoxDecoration(
              border: Border.all(
              width: 2,
            color: AppColors.primaryColor
          ),
              borderRadius: BorderRadius.circular(15)
          ),
            child: ImageSlideshow(
            indicatorColor: AppColors.primaryColor,
                initialPage: 0,
                isLoop: true,
                indicatorBottomPadding: 15.h,
                indicatorPadding: 8.w,
                indicatorRadius: 5,
                indicatorBackgroundColor: AppColors.whiteColor,
                autoPlayInterval: 3000,
                height: 190.h,
                children: productArg.images!.map((e) {
                  return Image.network(e,
                    fit: BoxFit.cover,);
                },).toList()
          
                ),
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
              SizedBox(height: 24.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(productArg.title ?? '',style: AppStyles.medium18PrimaryDark,)),
                  Text('EGP ${productArg.price ?? ''}',style: AppStyles.medium18PrimaryDark,),
                ],
              ),
              SizedBox(height: 24.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary30Opacity,
                          width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('${productArg.sold}  Sold',style: AppStyles.medium14PrimaryDark,),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        ImageIcon(AssetImage(AppAssets.rateIcon),color: AppColors.orangeColor,),
                        Text('${productArg.ratingsAverage} (${productArg.ratingsQuantity})',style: AppStyles.regular14Black,)
                      ],
                    ),
                  ),
      Container(
        padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 8.w
        ),
        width: 122.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              //todo: Decrement Count
                onTap: (){},
                child: Icon(Icons.remove_circle_outline_outlined,color: AppColors.whiteColor,)),
            Text('1',style: AppStyles.medium18White,),
            InkWell(
              //todo: Increment Count
                onTap: (){},
                child: Icon(Icons.add_circle_outline_outlined,color: AppColors.whiteColor,)),

          ],
        ),
      )
                ],
              ),
              SizedBox(height: 24.h,),
              Text('Description',style: AppStyles.medium18PrimaryDark,),
              SizedBox(height: 8.h,),
              ReadMoreText(
                productArg.description ??'',
                trimLines: 2,
              style: AppStyles.regular14PrimaryDarkWithOpacity,
              colorClickableText: AppColors.primaryColor,
              trimCollapsedText: 'Read More',
              trimExpandedText: ' Read Less',
              moreStyle: AppStyles.medium18Black,
            ),
              SizedBox(height: 24.h,),
              Text('Color',style: AppStyles.medium18PrimaryDark,),
              SizedBox(height: 8.h,),
              Row(
                spacing: 8.w,
                children: [
                  Image(image: AssetImage(AppAssets.blackColor)),
                  Image(image: AssetImage(AppAssets.redColor)),
                  Image(image: AssetImage(AppAssets.greenColor)),
                  Image(image: AssetImage(AppAssets.blueColor)),
                  Image(image: AssetImage(AppAssets.orangeColor)),
                ],
              ),
              SizedBox(height: 40.h,),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Total Price',style: AppStyles.medium18PrimaryDark,),
                      Text('EGP 3,500',style: AppStyles.medium18Black,),
                    ],
                  ),
                  SizedBox(width: 16.w,),
                  Expanded(
                    child: CustomElevatedButton(
                        text: '',
                        borderReadius: 34,
                        backgroundColor: AppColors.primaryColor,
                        iconWidget: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              ImageIcon(AssetImage(AppAssets.addToCartIcon,),color: AppColors.whiteColor,size: 35,),
                              SizedBox(width: 16.w,),
                              Text('Add to cart',style: AppStyles.medium20White,)
                            ],
                          ),
                        ),
                        isIcon: true,
                      onPressed: () {
                        //todo: Add to cart
                      },
          
                    ),
                  )
                ],
              )
          
          
          
          
          
          
          
          
          
          
          
            ]),
        ),
      )  );
  }
}
