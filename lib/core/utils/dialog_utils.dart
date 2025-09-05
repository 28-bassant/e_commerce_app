import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMsg,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.primaryDark),
              SizedBox(width: 8),
              Text(loadingMsg, style: AppStyles.medium14PrimaryDark),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showMsg({
    required BuildContext context,
    String? title,
    required String content,
    String? postActionName,
    Function? postFunc,
    String? negativeActionName,
    Function? negativeFunc,
  }) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(postFunc != null){
            //   postFunc.call();
            // }
            postFunc?.call();
          },
          child: Text(postActionName, style: AppStyles.semiBold16PrimaryDark),
        ),
      );
    }
    if (negativeActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(postFunc != null){
            //   postFunc.call();
            // }
            negativeFunc?.call();
          },
          child: Text(negativeActionName, style: AppStyles.medium14Black),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? '', style: AppStyles.semiBold16PrimaryDark),
          content: Text(content, style: AppStyles.medium14Black),
          actions: actions,
        );
      },
    );
  }
}
