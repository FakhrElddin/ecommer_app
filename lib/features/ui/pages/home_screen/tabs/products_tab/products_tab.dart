import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/features/ui/pages/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/product_tab_item.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsTabCubit, ProductsTabStates>(
      buildWhen: (previous, current) {
        return current is ProductsTabErrorState ||
            current is ProductsTabSuccessState ||
            current is ProductsTabLoadingState;
      },
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          CartCubit.get(context).getCartItems();
          ToastMessage.toastMsg(
            msg: 'Product Added Successfully.',
            backgroundColor: AppColors.greenColor,
            textColor: AppColors.whiteColor,
          );
        } else if (state is AddToCartErrorState) {
          ToastMessage.toastMsg(
            msg: state.failure.errorMessage,
            backgroundColor: AppColors.redColor,
            textColor: AppColors.whiteColor,
          );
        }
      },
      builder: (context, state) {
        if (state is ProductsTabErrorState) {
          return Center(child: Text(state.failure.errorMessage));
        } else if (state is ProductsTabSuccessState) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.5.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productsResponseEntity.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //todo: navigate to product details screen
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productRoute,
                            arguments:
                                state.productsResponseEntity.data![index],
                          );
                        },
                        child: ProductTabItem(
                          productsDataEntity:
                              state.productsResponseEntity.data![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
      },
    );
  }
}
