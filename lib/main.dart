import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
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
         theme: AppTheme.lightTheme,
       );
     },
   );
  }
}