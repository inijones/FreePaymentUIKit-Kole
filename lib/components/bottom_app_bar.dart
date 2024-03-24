import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freepaymentuikit_kole/components/text_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';

class CustomBottomAppBarItem {
  final String imageData;
  final String text;

  CustomBottomAppBarItem(this.imageData, this.text);
}

class CustomBottomAppBar extends StatefulWidget {
  final List<CustomBottomAppBarItem> items;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? textColor;
  final Color? selectedColor;
  final ValueChanged<int> onTabSelected;

  const CustomBottomAppBar({
    super.key,
    required this.items,
    this.height,
    this.iconSize,
    this.backgroundColor,
    this.color,
    this.textColor,
    this.selectedColor,
    required this.onTabSelected,
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  // Update Index
  _updatedIndex(int index) {
    widget.onTabSelected(index);
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      _buildTabItem(
        item: widget.items[0],
        index: 0,
        onPressed: _updatedIndex,
      ),
      _buildTabItem(
        item: widget.items[1],
        index: 1,
        onPressed: _updatedIndex,
      ),
      Container(
        decoration: const BoxDecoration(
            color: FreePaymentUIColors.greenColor, shape: BoxShape.circle),
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          AssetPath.scan,
          color: Colors.white,
        ),
      ),
      _buildTabItem(
        item: widget.items[2],
        index: 2,
        onPressed: _updatedIndex,
      ),
      _buildTabItem(
        item: widget.items[3],
        index: 3,
        onPressed: _updatedIndex,
      ),
    ];

    return SizedBox(
      child: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 8.0.h,
            left: 8.0.w,
            right: 8.0.w,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    CustomBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color? color =
        _selectedIndex == index ? widget.selectedColor : widget.color;
    Color? textColor = _selectedIndex == index
        ? FreePaymentUIColors.blueColor
        : FreePaymentUIColors.neutral60;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: InkWell(
          onTap: () => onPressed!(index!),
          borderRadius: BorderRadius.circular(10.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image
              SvgPicture.asset(
                item!.imageData,
                color: color,
                height: 25.h,
                width: 25.w,
              ),
              RobotoText(
                text: item.text,
                textColor: textColor,
                fontSize: 12.h,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
