import 'package:e_commerce_app/config/my_bloc_observer.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/di.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: const Size(430, 932),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (context,child){
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         initialRoute: AppRoutes.loginRoute,
         routes: {
           AppRoutes.loginRoute : (context) => LoginScreen(),
           AppRoutes.registerRoute : (context) => RegisterScreen(),
           AppRoutes.homeRoute : (context) => HomeScreen(),

         },
         theme: AppTheme.lightTheme,
       );
     },
   );
  }
}