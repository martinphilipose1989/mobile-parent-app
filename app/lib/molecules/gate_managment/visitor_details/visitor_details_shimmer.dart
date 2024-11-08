import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class VisitorDetailsPageShimmer extends StatelessWidget {
  const VisitorDetailsPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and Name Shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 200.w,
                    height: 20.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 120.w,
                    height: 16.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Contact Number and Email ID Shimmer
            _buildShimmerRow(width1: 150.w, width2: 150.w),
            SizedBox(height: 32.h),

            // Type of Visitor and Student Name Shimmer
            _buildShimmerRow(width1: 140.w, width2: 160.w),
            SizedBox(height: 32.h),

            // Point Of Contact and Purpose Of Visit Shimmer
            _buildShimmerRow(width1: 160.w, width2: 160.w),
            SizedBox(height: 32.h),

            // IN Date & Time and Coming From Shimmer
            _buildShimmerRow(width1: 160.w, width2: 120.w),
            SizedBox(height: 32.h),

            // Guest Count Shimmer
            Container(
              width: 100.w,
              height: 16.h,
              color: Colors.white,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerRow({required double width1, required double width2}) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width1,
            height: 16.h,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16.w),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width2,
            height: 16.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: REdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                _buildShimmerRow(width1: 100.w, width2: 150.w),
                SizedBox(height: 16.h),
                _buildShimmerRow(width1: 140.w, width2: 180.w),
                SizedBox(height: 16.h),
                _buildShimmerRow(width1: 120.w, width2: 160.w),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildShimmerRow({required double width1, required double width2}) {
  return Row(
    children: [
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width1,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
      SizedBox(width: 16.w),
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width2,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    ],
  );
}
