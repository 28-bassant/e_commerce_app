import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMsg;
  final VoidCallback? onTryAgain;
   MainErrorWidget({super.key,required this.errorMsg,
   this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMsg,style: AppStyles.semiBold20Primary,),
        onTryAgain != null?
        ElevatedButton(onPressed: onTryAgain,
            child: Text('Try Again',
            style: AppStyles.semiBold16PrimaryDark,)):
            Container()
      ],
    );
  }
}
