import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce_app/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController(text: 'Bassant');
  TextEditingController mobileNumberController = TextEditingController(text: '01123456789');
  TextEditingController emailController = TextEditingController(text: 'bassant1@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '18061717@A');
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,AuthStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is AuthLoadingState){
          DialogUtils.showLoading(context: context, loadingMsg: 'Loading...',
          );
        }
        else if(state is AuthErrorState){
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMsg(context: context, content: state.message,
              title: 'Error',postActionName: 'Ok');
        }
        else if(state is AuthSuccessState){
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMsg(context: context, content: 'Register Successfully',
              title: 'Success',postActionName: 'Ok',
          postFunc: (){
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRoute,
                  (route) => true,);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(
            color: AppColors.whiteColor
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
                right: 16.w,
                left: 16.w,
                bottom: 86.h
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(image: AssetImage(AppAssets.routeImage)),
                SizedBox(height: 60.h,),
                Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('User Name',style: AppStyles.medium18White,),
                        SizedBox(height: 24.h,),
                        CustomTextFormField(
                          hintText: 'enter your full name',
                          onValidator: AppValidators.validateFullName,
                          controller: fullNameController,
                        ),
                        SizedBox(height: 32.h,),
                        Text('Mobile Number',style: AppStyles.medium18White,),
                        SizedBox(height: 24.h,),
                        CustomTextFormField(
                          hintText: 'enter your mobile no',
                          onValidator: AppValidators.validatePhoneNumber,
                          controller: mobileNumberController,
                        ),
                        SizedBox(height: 32.h,),
                        Text('E-mail address',style: AppStyles.medium18White,),
                        SizedBox(height: 24.h,),
                        CustomTextFormField(
                          hintText: 'enter your email address',
                          onValidator: AppValidators.validateEmail,
                          controller: emailController,
                        ),
                        SizedBox(height: 32.h,),
                        Text('Password',style: AppStyles.medium18White,),
                        CustomTextFormField(
                          hintText: 'enter your password',
                          obscureText: isVisible ? false : true,
                          controller: passwordController,
                          onValidator: AppValidators.validatePassword,
                          suffixIcon:
                          isVisible?
                          InkWell(
                              onTap: (){
                                isVisible = false;
                                setState(() {

                                });
                              },
                              child: Icon(Icons.visibility_outlined)):
                          InkWell(
                              onTap: () {
                                isVisible = true;
                                setState(() {

                                });
                              },
                              child: Icon(Icons.visibility_off_outlined)),
                        ),

                        SizedBox(height: 56.h,),
                        CustomElevatedButton(
                          text: 'Sign Up',
                          onPressed: () {
                            //todo: Register
                            viewModel.register(
                                email: emailController.text,
                                password: passwordController.text,
                                name: fullNameController.text,
                                rePassword: passwordController.text,
                                phone: mobileNumberController.text);
                          }
                        ),



                      ],

                    ))




              ],
            ),
          ),
        ),
      ),
    );
  }
}

