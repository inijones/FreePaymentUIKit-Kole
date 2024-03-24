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
    return Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: SizedBox(
        height: 64.h,
        width: 300.w,
        child: Stack(
          children: [
            Image.asset(
              bgAssetPath ?? AssetPath.greenBg,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      RobotoText(
                        text: text ?? "Co.payment Cards",
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                      SizedBox(width: 30.w),
                      Row(
                        children: [
                          RobotoText(
                            text: "**** 1121",
                            fontSize: 14.sp,
                          ),
                          SizedBox(width: 5.w),
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
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.width,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.onTap,
  });

  final double width;
  final int index;
  final int currentIndex;
  final String label;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0.sp),
        decoration: BoxDecoration(
            color: currentIndex == 1
                ? FreePaymentUIColors.neutral40.withOpacity(0.06)
                : null,
            borderRadius: BorderRadius.circular(10)),
        child: RobotoText(
          text: label,
          fontSize: 12.sp,
          textColor:
              currentIndex == 1 ? Colors.black : FreePaymentUIColors.neutral60,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap(index);
      },
    );
  }
}
