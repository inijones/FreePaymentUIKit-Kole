import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/activity_screen2.dart';
import 'package:freepaymentuikit_kole/components/top_row_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';

class ActivityScreen2 extends StatefulWidget {
  const ActivityScreen2({super.key});

  @override
  State<ActivityScreen2> createState() => _ActivityScreen2State();
}

class _ActivityScreen2State extends State<ActivityScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.h),

              // Top Row
              const TopRowWidget(
                goBack: true,
              ),
              SizedBox(height: 30.h),

              // Total Spending
              const TotalSpendingWidget(),

              SizedBox(height: 30.h),

              // Chart Bar
              Image.asset(AssetPath.chartBarImage),

              SizedBox(height: 30.h),

              // Expense and Income
              Row(
                children: [
                  const ExpenseIncomeWidget(),
                  SizedBox(width: 15.w),
                  const ExpenseIncomeWidget(
                    isExpense: true,
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // Total Balance and Total Spending
              const CategoriesRow(),

              SizedBox(height: 30.h),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 15.w,
                  children: const [
                    CategoriesListItem(),
                    CategoriesListItem(
                      icon: AssetPath.carIcon,
                      titleText: "Travelling",
                      amountText: "\$312.52",
                    ),
                    CategoriesListItem(
                      icon: AssetPath.crownIcon,
                      titleText: "Subscription",
                      amountText: "\$117.92",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
