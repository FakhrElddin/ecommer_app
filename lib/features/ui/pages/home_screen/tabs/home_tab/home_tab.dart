import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/domain/entities/categories_response_entity.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/category_brand_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeTabCubit viewModel = getIt<HomeTabCubit>();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildAnnouncement(
            images: [
              AppAssets.announcement1,
              AppAssets.announcement2,
              AppAssets.announcement3,
            ],
          ),
          SizedBox(height: 24.h),
          _lineBreak(name: "Categories"),
          BlocBuilder<HomeTabCubit, HomeTabStates>(
            bloc: viewModel..getAllCategories(),
            builder: (context, state) {
              if (state is HomeTabCategoriesErrorState) {
                return Center(child: Text(state.failure.errorMessage));
              } else if (state is HomeTabCategoriesSuccessState) {
                return _buildCategoryBrandSec(
                  categoryList: state.categoriesResponseEntity.data!,
                  crossAxisCount: 2,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          ),
          _lineBreak(name: "Brands"),
          //_buildCategoryBrandSec(const CategoryBrandItem()),
        ],
      ),
    );
  }

  SizedBox _buildCategoryBrandSec({
    required List<CategoryDataEntity> categoryList,
    int crossAxisCount = 3,
  }) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
        ),
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(dataEntity: categoryList[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        ),
      ],
    );
  }
}
