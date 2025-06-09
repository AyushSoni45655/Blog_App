import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/presentation/widgets/custom_text.dart';
import 'helper_funcction.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
       primary: true,
      itemCount: 4, //
      // Number of shimmer items
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: DimensionHelper.dimens_20.h,
          ),
          height: DimensionHelper.dimens_300.h,
          width: DimensionHelper.dimens_all,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 3),
            borderRadius: BorderRadius.circular(DimensionHelper.dimens_40.r),
          ),
          child: Stack(
            children: [
              // ⬛ Image Placeholder with shimmer
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: DimensionHelper.dimens_180.h,
                    width: DimensionHelper.dimens_all,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(DimensionHelper.dimens_40.r),
                      ),
                    ),
                  ),
                ),
              ),

              // ⬛ Title Placeholder shimmer
              Positioned(
                top: DimensionHelper.dimens_190,
                left: 20,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 25.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),

              // ⬛ Date Placeholder shimmer
              Positioned(
                bottom: 10,
                left: DimensionHelper.dimens_30,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 20.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),

              // ⬛ Time Placeholder shimmer
              Positioned(
                bottom: 10,
                right: DimensionHelper.dimens_30,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 20.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
