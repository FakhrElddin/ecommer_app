import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
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
    ProductsTabCubit viewModel = getIt<ProductsTabCubit>();
    return BlocBuilder<ProductsTabCubit, ProductsTabStates>(
      bloc: viewModel..getAllProducts(),
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
                      childAspectRatio: 2 / 3.2.h,
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
                            arguments: state.productsResponseEntity.data![index],
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
