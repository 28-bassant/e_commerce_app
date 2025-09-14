import 'package:e_commerce_app/features/ui/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../tabs/favourite_tab/favourite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab/products_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitialState());
  //todo : hold data - handle logic
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductsTab(),
    FavouriteTab(),
    ProfileTab()
  ];
}