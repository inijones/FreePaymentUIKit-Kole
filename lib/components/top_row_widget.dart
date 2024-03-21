
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/app_topbuttons.dart';
import 'package:freepaymentuikit_kole/components/text_widget.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({
    super.key,
    this.goBack
  });

  final bool? goBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         AppBackButton(goBack: goBack,),
        RobotoText(
          text: "Activity",
          textColor: FreePaymentUIColors.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        const AppBackButton(isBackButton: false),
      ],
    );
  }
}
