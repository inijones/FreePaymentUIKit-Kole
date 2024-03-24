import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/bottom_app_bar.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';
import 'package:freepaymentuikit_kole/features/views/activity_screen.dart';
import 'package:freepaymentuikit_kole/features/views/home_page.dart';
import 'package:freepaymentuikit_kole/features/views/my_card_screen.dart';
import 'package:freepaymentuikit_kole/features/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  late List<Widget> tabOption = [
    const HomePage(),
    const CardScreen(),
    const ActivityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: tabOption.elementAt(selectedIndex),
        bottomNavigationBar: CustomBottomAppBar(
          height: 90.h,
          color: null,
          onTabSelected: _selectedTab,
          selectedColor:
              selectedIndex == 0 ? null : FreePaymentUIColors.blueColor,
          items: [
            CustomBottomAppBarItem(
              AssetPath.homeIcon,
              'Home',
            ),
            CustomBottomAppBarItem(
              AssetPath.cardIcon,
              'Card',
            ),
            CustomBottomAppBarItem(
              AssetPath.activityIcon,
              'Activity',
            ),
            CustomBottomAppBarItem(
              AssetPath.profileIcon,
              'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
