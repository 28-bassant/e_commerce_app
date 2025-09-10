
import 'dart:ui';

import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color? filledColor;
  Color? borderColor;
  String hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator onValidator;
  TextInputType? keyboardType;
  TextEditingController? controller;
  bool obscureText;
  int? maxLines;
  TextStyle? textStyle;

  CustomTextFormField({
    this.filledColor,
    super.key,
    this.maxLines,
    this.borderColor,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onValidator,
    this.keyboardType,
    this.obscureText = false,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: builtTextFieldBorder(
          borderColor:
          borderColor ?? AppColors.whiteColor
        ),
        focusedBorder: builtTextFieldBorder(borderColor: borderColor),
        errorBorder: builtTextFieldBorder(borderColor: AppColors.redColor),
        errorStyle: AppStyles.medium14Black.copyWith(color: AppColors.redColor),
        fillColor: filledColor ?? AppColors.whiteColor,
        filled: true,
        hintText: hintText,

        hintStyle:
        hintStyle ?? AppStyles.light18Black,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      maxLines: maxLines ?? 1,
      style:textStyle ?? AppStyles.medium14PrimaryDark,
      validator: onValidator,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  OutlineInputBorder builtTextFieldBorder({required Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.whiteColor,
        width: 1,
      ),
    );
  }
}
