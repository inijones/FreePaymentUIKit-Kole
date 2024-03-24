import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freepaymentuikit_kole/components/text_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    super.key,
    this.titleText,
    this.amountText,
    this.icon,
  });

  final String? titleText;
  final String? amountText;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 134.h,
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 20.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon ?? AssetPath.bankIcon),
            const Spacer(),
            RobotoText(
              text: titleText ?? "Investment",
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              textColor: FreePaymentUIColors.neutral70,
            ),
            SizedBox(height: 10.h),
            RobotoText(
              text: amountText ?? "\$595.20",
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              textColor: FreePaymentUIColors.blueColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RobotoText(
          text: "Categories",
          textColor: FreePaymentUIColors.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        Row(
          children: [
            RobotoText(
              text: "Expenses",
              textColor: FreePaymentUIColors.blueColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            const Icon(Icons.keyboard_arrow_down_sharp, size: 20),
          ],
        ),
      ],
    );
  }
}

class ExpenseIncomeWidget extends StatelessWidget {
  const ExpenseIncomeWidget({super.key, this.isExpense});

  final bool? isExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(
          color: const Color(0xffF3F4F6),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xffF9FAFB),
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
            child: Center(
              child: Icon(
                isExpense == true ? Icons.arrow_downward : Icons.arrow_upward,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RobotoText(
                text: isExpense == true ? "Expense" : "Income",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                textColor: FreePaymentUIColors.neutral40,
              ),
              SizedBox(height: 5.h),
              RobotoText(
                text: isExpense == true ? "\$2,265.80" : "\$5,300.00",
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                textColor: FreePaymentUIColors.blueColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class TotalSpendingWidget extends StatelessWidget {
  const TotalSpendingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RobotoText(
              text: "Total Spending",
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              textColor: FreePaymentUIColors.neutral50,
            ),
            RobotoText(
              text: "\$2,265.80",
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              textColor: FreePaymentUIColors.blueColor,
            ),
          ],
        ),
        const Spacer(),

        // Month Button
        Container(
          height: 32.h,
          width: 86.w,
          decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RobotoText(
                  text: "Month",
                  textColor: FreePaymentUIColors.blueColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
