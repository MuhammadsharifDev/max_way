import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget(
      {super.key,
        required this.bannerImage,
        required this.fit,
        required this.controller});

  final String bannerImage;
  final PageController controller;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(
            width: 343.w,
            height: 153.h,
            child: CachedNetworkImage(
              imageUrl: bannerImage,
              fit: fit,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // child:Image.network(state.bannerResponse?.banners?[index].image??'',fit: BoxFit.cover,)
          ),
          Container(
            height: 16.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColors,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.defaultInkColor,
                  dotColor: AppColors.whiteColors,
                  dotHeight: 4,
                  dotWidth: 8,
                  spacing: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}