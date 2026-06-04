import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/domain/entities/products_response_entity.dart';
import 'package:ecommerce_app/features/ui/pages/product_details_screen/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/product_details_screen/cubit/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/product_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  final List<int> sizes = const [35, 38, 39, 40];

  final List<Color> color = const [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit viewModel = ProductDetailsCubit();
    var productsDataEntity =
        ModalRoute.of(context)!.settings.arguments as ProductsDataEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details", style: AppStyles.semi20Primary),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(items: productsDataEntity.images!),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      productsDataEntity.title!,
                      style: AppStyles.medium18Header,
                    ),
                  ),
                  Text(
                    "EGP ${productsDataEntity.price}",
                    style: AppStyles.medium18Header,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor.withValues(alpha: 0.3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      '${productsDataEntity.sold ?? ''} Sold',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium14PrimaryDark,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Image.asset(AppAssets.starIcon, width: 20.w),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "${productsDataEntity.ratingsAverage ?? ''} (${productsDataEntity.ratingsQuantity ?? ''})",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular14Text,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 7.h,
                    ),
                    child:
                        BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                          bloc: viewModel,
                          builder: (context, state) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    viewModel.decreaseProductCounter();
                                  },
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    size: 20.w,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(width: 18.w),
                                AutoSizeText(
                                  '${viewModel.productCounter}',
                                  style: AppStyles.medium18White,
                                ),
                                SizedBox(width: 18.w),
                                InkWell(
                                  onTap: () {
                                    viewModel.increaseProductCounter(
                                      quantity: 10,
                                    );
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: AppColors.whiteColor,
                                    size: 20.w,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: AppStyles.medium18Header),
                  SizedBox(height: 8.h),
                  ReadMoreText(
                    productsDataEntity.description ?? '',
                    style: AppStyles.medium14LightPrimary,
                    trimExpandedText: ' Read Less',
                    trimCollapsedText: ' Read More',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    colorClickableText: AppColors.primaryColor,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Size', style: AppStyles.medium18Header),
                  SizedBox(height: 8.h),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                    bloc: viewModel,
                    builder: (context, state) {
                      return SizedBox(
                        height: 45.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                viewModel.changeSelectedSize(index: index);
                              },
                              child: CircleAvatar(
                                radius: 22.r,
                                backgroundColor: index == viewModel.selectedSize
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 9.w,
                                    vertical: 9.h,
                                  ),
                                  child: Text(
                                    '${sizes[index]}',
                                    style: AppStyles.regular14Text.copyWith(
                                      color: index == viewModel.selectedSize
                                          ? AppColors.whiteColor
                                          : AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 17.w),
                          itemCount: sizes.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Color', style: AppStyles.medium18Header),
                  SizedBox(height: 8.h),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                    bloc: viewModel,
                    builder: (context, state) {
                      return SizedBox(
                        height: 45.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                viewModel.changeSelectedColor(index: index);
                              },
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: color[index],
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.check,
                                    color: index == viewModel.selectedColor
                                        ? AppColors.whiteColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 17.w),
                          itemCount: color.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: AppStyles.medium18Header.copyWith(
                          color: AppColors.primaryColor.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'EGP ${productsDataEntity.price}',
                        style: AppStyles.medium18Header,
                      ),
                    ],
                  ),
                  SizedBox(width: 33.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 14.h,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(width: 15.w),
                          AutoSizeText(
                            "Add To Cart",
                            style: AppStyles.medium20White,
                          ),
                          SizedBox(width: 27.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
