import 'package:e_commerce_app/features/ui/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel,CartStates>(
builder: (context, state) {
  final viewModel = CartViewModel.get(context);
  return Badge(
    backgroundColor: AppColors.greenColor,
    textColor: AppColors.whiteColor,
    label: Text(viewModel.numOfCartItems.toString()),
    child: ImageIcon(AssetImage(AppAssets.shoppingCartIcon),
      color: AppColors.primaryColor,
      size: 35,
    ),
  );
},

    );
  }
}
