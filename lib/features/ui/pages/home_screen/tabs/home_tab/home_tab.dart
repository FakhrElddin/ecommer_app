import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/category_brand_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          _buildAnnouncement(
            images: [
              AppAssets.announcement1,
              AppAssets.announcement2,
              AppAssets.announcement3,
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          _lineBreak(name: "Categories"),
          _buildCategoryBrandSec(const CategoryBrandItem()),
          _lineBreak(name: "Brands"),
          _buildCategoryBrandSec(const CategoryBrandItem()),
        ],
      ),
    );
  }

  SizedBox _buildCategoryBrandSec(Widget categoryBrand) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return categoryBrand;
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
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
          return Image.asset(
            url,
            fit: BoxFit.fill,
          );
        }).toList());
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
        )
      ],
    );
  }
}
