import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';
import 'package:freepaymentuikit_kole/utils/navigator.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.isBackButton = true,
    this.goBack = false,
  });

  final bool isBackButton;
  final bool? goBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goBack == true ? popView(context) : () {},
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          border: Border.all(
            color: FreePaymentUIColors.neutral100,
            width: 1,
          ),
        ),
        child: Center(
          child: isBackButton
              ? const Icon(
                  Icons.chevron_left,
                  color: Color(0xff1D3A70),
                )
              : const Icon(Icons.more_horiz, color: Color(0xff1D3A70)),
        ),
      ),
    );
  }
}
