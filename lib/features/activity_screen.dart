import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/activity_screen.dart';
import 'package:freepaymentuikit_kole/components/top_row_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/features/activity_screen2.dart';
import 'package:freepaymentuikit_kole/utils/navigator.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: const TopRowWidget(),
            ),
            SizedBox(height: 20.h),

            // Card Scroll
            const SmartcardScroll(),

            SizedBox(height: 10.h),

            // Slider Icon
            Image.asset(AssetPath.sliderIcon),

            SizedBox(height: 30.h),

            // Total Spending
            InkWell(
              onTap: () => navigate(context, const ActivityScreen2()),
              child: Image.asset(
                AssetPath.spendingChart,
                height: 365.h,
                width: 327.w,
              ),
            ),

            SizedBox(height: 20.h),

            // Total Balance
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                children: [
                  const HeaderWidget(),
                  SizedBox(height: 20.h),
                  const ListItem()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
