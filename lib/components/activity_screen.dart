

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/text_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';

class SmartcardScroll extends StatelessWidget {
  const SmartcardScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const CardScrollWidget(),
            SizedBox(width: 16.w),
            const CardScrollWidget(
              bgAssetPath: AssetPath.blueBg,
              text: "Smartpay Card",
            ),
            SizedBox(width: 16.w),
            const CardScrollWidget(),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RobotoText(
          text: "Transactions",
          textColor: FreePaymentUIColors.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        Row(
          children: [
            RobotoText(
              text: "All",
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
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: const BoxDecoration(color: Color(0xffF9FAFB)),
          child: Center(
            child: Image.asset(
              AssetPath.amazonIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RobotoText(
              text: "Amazon",
              fontWeight: FontWeight.bold,
              textColor: FreePaymentUIColors.blueColor,
            ),
            RobotoText(
              text: "Payment",
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              textColor: FreePaymentUIColors.neutral60,
            ),
          ],
        ),
        const Spacer(),
        const RobotoText(
          text: "-\$59.00",
          fontWeight: FontWeight.bold,
          textColor: FreePaymentUIColors.blueColor,
        ),
      ],
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  const CardScrollWidget({
    super.key,
    this.bgAssetPath = AssetPath.greenBg,
    this.text,
  });

  final String? bgAssetPath;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 316.w,
      child: Stack(
        children: [
          Image.asset(bgAssetPath ?? AssetPath.greenBg),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(
                      text: text ?? "Co.payment Cards",
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        const RobotoText(text: "**** 1121"),
                        SizedBox(width: 15.w),
                        Image.asset(
                          AssetPath.mastercardIcon,
                          height: 24.h,
                          width: 40.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
