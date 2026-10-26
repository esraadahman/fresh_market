import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingContainerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final double? topMargin;
  final Color? color;

  const ShimmerLoadingContainerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    this.topMargin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Shimmer.fromColors(
      baseColor: color == null
          ? isLight
                ? Colors.grey.shade200
                : Colors.grey.shade700
          : color!,
      highlightColor: color == null
          ? isLight
                ? Colors.grey.shade300
                : Colors.grey.shade800
          : color!.withOpacity(0.5),
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsetsDirectional.only(top: topMargin ?? 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          color: color == null
              ? isLight
                    ? Colors.grey.shade200
                    : Colors.grey.shade800
              : color!.withOpacity(0.5),
        ),
      ),
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar shimmer
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
            child: ShimmerLoadingContainerWidget(
              height: 48.h,
              width: double.infinity,
              radius: 12,
            ),
          ),

          SizedBox(height: 16.h),

          // Category chips shimmer (All Seafood / Sushi / Lobster / Fish ...)
          SizedBox(
            height: 90.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return ShimmerLoadingContainerWidget(
                  height: 90.h,
                  width: 90.w,
                  radius: 16,
                );
              },
            ),
          ),

          SizedBox(height: 20.h),

          // "Recommended Seafood" section title shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ShimmerLoadingContainerWidget(
              height: 18.h,
              width: 180.w,
              radius: 8,
            ),
          ),

          SizedBox(height: 16.h),

          // Product grid shimmer
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Circular product image placeholder
                          ShimmerLoadingContainerWidget(
                            height: 100.h,
                            width: 100.w,
                            radius: 50,
                          ),
                          SizedBox(height: 14.h),
                          ShimmerLoadingContainerWidget(
                            height: 14.h,
                            width: 90.w,
                            radius: 8,
                          ),
                          SizedBox(height: 8.h),
                          ShimmerLoadingContainerWidget(
                            height: 14.h,
                            width: 60.w,
                            radius: 8,
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: -14,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ShimmerLoadingContainerWidget(
                          height: 32.h,
                          width: 32.w,
                          radius: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class ProductDetailsShimmerLoadingWidget extends StatelessWidget {
  const ProductDetailsShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoadingContainerWidget(
            height: 320.h,
            width: double.infinity,
            radius: 0,
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoadingContainerWidget(
                  height: 24.h,
                  width: double.infinity,
                  radius: 8,
                ),
                SizedBox(height: 10.h),
                ShimmerLoadingContainerWidget(
                  height: 24.h,
                  width: 220.w,
                  radius: 8,
                ),

                SizedBox(height: 18.h),

                Row(
                  children: [
                    ShimmerLoadingContainerWidget(
                      height: 26.h,
                      width: 120.w,
                      radius: 8,
                    ),
                    SizedBox(width: 10.w),
                    ShimmerLoadingContainerWidget(
                      height: 18.h,
                      width: 80.w,
                      radius: 8,
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                ShimmerLoadingContainerWidget(
                  height: 38.h,
                  width: 100.w,
                  radius: 12,
                ),

                SizedBox(height: 28.h),

                ShimmerLoadingContainerWidget(
                  height: 22.h,
                  width: 130.w,
                  radius: 8,
                ),
                SizedBox(height: 12.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: double.infinity,
                  radius: 8,
                ),
                SizedBox(height: 8.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: double.infinity,
                  radius: 8,
                ),
                SizedBox(height: 8.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: 260.w,
                  radius: 8,
                ),

                SizedBox(height: 28.h),

                ShimmerLoadingContainerWidget(
                  height: 22.h,
                  width: 130.w,
                  radius: 8,
                ),
                SizedBox(height: 12.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: double.infinity,
                  radius: 8,
                ),
                SizedBox(height: 8.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: double.infinity,
                  radius: 8,
                ),
                SizedBox(height: 8.h),
                ShimmerLoadingContainerWidget(
                  height: 14.h,
                  width: 300.w,
                  radius: 8,
                ),

                SizedBox(height: 28.h),

                ShimmerLoadingContainerWidget(
                  height: 22.h,
                  width: 170.w,
                  radius: 8,
                ),
                SizedBox(height: 12.h),

                SizedBox(
                  height: 230.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 150.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ShimmerLoadingContainerWidget(
                                  height: double.infinity,
                                  width: double.infinity,
                                  radius: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShimmerLoadingContainerWidget(
                                      height: 12.h,
                                      width: double.infinity,
                                      radius: 8,
                                    ),
                                    SizedBox(height: 6.h),
                                    ShimmerLoadingContainerWidget(
                                      height: 12.h,
                                      width: 90.w,
                                      radius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
