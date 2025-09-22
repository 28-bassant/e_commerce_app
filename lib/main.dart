import 'package:e_commerce_app/config/my_bloc_observer.dart';
import 'package:e_commerce_app/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/domain/entities/response/product.dart';
import 'package:e_commerce_app/features/ui/cart/cart_screen.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/home_screen/home_screen.dart';
import 'package:e_commerce_app/features/ui/home_screen/tabs/products_tab/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/di.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPrefsUtils.init();
  configureDependencies();
  String routeName;
  var token = SharedPrefsUtils.getData(key: 'token');
  if(token == null){
    //todo: no user , no token =>login
    routeName = AppRoutes.loginRoute;
  }else{
    //todo: use , token => home
    routeName = AppRoutes.homeRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartViewModel>())
      ],
      child: MyApp(routeName: routeName,)));
}
class MyApp extends StatelessWidget{
  String routeName;
  MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: const Size(430, 932),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (context,child){
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         initialRoute: routeName,
         routes: {
           AppRoutes.loginRoute : (context) => LoginScreen(),
           AppRoutes.registerRoute : (context) => RegisterScreen(),
           AppRoutes.homeRoute : (context) => HomeScreen(),
           AppRoutes.productRoute : (context) => ProductDetails(),
           AppRoutes.cartRoute : (context) => CartScreen(),

         },
         theme: AppTheme.lightTheme,
       );
     },
   );
  }
}