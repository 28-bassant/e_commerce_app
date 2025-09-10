import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/features/ui/auth/states/auth_states.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: 'adasdfvv@fds.com');
  TextEditingController passwordController = TextEditingController(text: '18061717@A');
  bool isVisible = false;
  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,AuthStates>(
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
          DialogUtils.showMsg(context: context, content: 'Login Successfully',
              title: 'Success',postActionName: 'Ok');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              top: 70.h,
              bottom: 86.h
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Image(image: AssetImage(AppAssets.routeImage)),
                SizedBox(height: 60.h,),
                Text('Welcome Back To Route',style: AppStyles.semiBold24White,),
                Text('Please sign in with your mail',style: AppStyles.light16White,),
                SizedBox(height: 40.h,),
                Form(
                  key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Email',style: AppStyles.medium18White,),
                        SizedBox(height: 24.h,),
                        CustomTextFormField(
                          hintText: 'enter your email',
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
                        SizedBox(height: 1.h,),
                        Text('Forgot password',style:AppStyles.regular18White,textAlign: TextAlign.end,),
                        SizedBox(height: 56.h,),
                        CustomElevatedButton(text: 'Login',
                        onPressed: () {
                          //todo : Login
                          viewModel.login(email: emailController.text,password: passwordController.text);
                        },),
                        SizedBox(height: 32.h,),
                        Row(
                          children: [
                            Text('Don’t have an account? ',style: AppStyles.medium18White,),
                            InkWell(
                                onTap: () {
                                  //todo: Navigate to Register Screen
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutes.registerRoute,
                                      (route) => true,);
                                },
                                child: Text('Create Account ',style: AppStyles.medium18White,)),
                          ],
                        )


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
