import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // shrink column to content
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            width: 80,
            height: 80,
            imageUrl:
            "https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
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
        ),
        SizedBox(height: 8.h),
        Text(
          'laptops & electronics',
          textAlign: TextAlign.center, // 🔹 center the text
          style: AppStyles.regular14Black,
          maxLines: 2, // prevent overflow
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
