import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/activity_screen.dart';
import 'package:freepaymentuikit_kole/components/text_widget.dart';
import 'package:freepaymentuikit_kole/components/top_row_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';
import 'package:freepaymentuikit_kole/features/models/chart_model.dart';
import 'package:freepaymentuikit_kole/features/views/activity_screen2.dart';
import 'package:freepaymentuikit_kole/utils/navigator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  PageController pageController = PageController(viewportFraction: 2.5 / 3);

  // List of Stops
  final List<double> stops = <double>[0.0, 0.5, 1.0];
  late TrackballBehavior _trackballBehavior;

  double width = 80.w;

  @override
  void initState() {
    super.initState();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipAlignment: ChartAlignment.near,
      shouldAlwaysShow: true,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        color: FreePaymentUIColors.blueColor,
      ),
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    );
    super.initState();
  }

  final List<Color> color = <Color>[
    FreePaymentUIColors.greenColor.withOpacity(0.7),
    FreePaymentUIColors.greenColor.withOpacity(0.3),
    Colors.white
  ];

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: const TopRowWidget(),
              ),
              SizedBox(height: 20.h),

              // Card Scroll
              SizedBox(
                height: 64.h,
                child: PageView(
                  clipBehavior: Clip.antiAlias,
                  padEnds: true,
                  pageSnapping: true,
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CardScrollWidget(),
                    CardScrollWidget(
                      bgAssetPath: AssetPath.blueBg,
                      text: "Smartpay Card",
                    ),
                    CardScrollWidget(),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              // Slider Icon
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: SlideEffect(dotHeight: 6.sp, dotWidth: 6.sp),
              ),

              SizedBox(height: 30.h),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0.w),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: FreePaymentUIColors.neutral60.withOpacity(0.07)),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    // Total Spending
                    InkWell(
                      onTap: () => navigate(context, const ActivityScreen2()),
                      child: Column(
                        children: [
                          RobotoText(
                            text: "Total Spending",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            textColor: FreePaymentUIColors.neutral60,
                          ),
                          SizedBox(height: 10.h),
                          RobotoText(
                            text: "\$5,215.00",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            textColor: FreePaymentUIColors.blueColor,
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),

                    // Filter Widgets
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FilterWidget(
                            label: "Day",
                            width: width,
                            index: 0,
                            currentIndex: 0,
                            onTap: (index) {},
                          ),
                          FilterWidget(
                            label: "Week",
                            width: width,
                            index: 1,
                            currentIndex: 1,
                            onTap: (index) {},
                          ),
                          FilterWidget(
                            label: "Month",
                            width: width,
                            index: 2,
                            currentIndex: 2,
                            onTap: (index) {},
                          ),
                          FilterWidget(
                            label: "Year",
                            width: width,
                            index: 3,
                            currentIndex: 3,
                            onTap: (index) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Chart
                    SizedBox(
                      height: 200.h,
                      child: SfCartesianChart(
                        // plotAreaBorderWidth: 0,
                        trackballBehavior: _trackballBehavior,
                        borderWidth: 1.0,
                        primaryXAxis: CategoryAxis(
                          isInversed: false,
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                          axisLine: const AxisLine(width: 0),
                          majorGridLines: const MajorGridLines(
                            width: 1,
                            dashArray: [10, 10],
                          ),
                          labelIntersectAction:
                              AxisLabelIntersectAction.rotate90,
                        ),
                        primaryYAxis: const NumericAxis(
                          minimum: 1,
                          maximum: 4,
                          interval: 1,
                          borderWidth: 0,
                          isVisible: false,
                          axisLine: AxisLine(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        // tooltipBehavior: _tooltip,
                        series: [
                          SplineAreaSeries<ChartDataModel, String>(
                              dataLabelSettings: DataLabelSettings(
                                isVisible: false,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              dataSource: _expenses,
                              yValueMapper: (ChartDataModel data, _) => data.y,
                              xValueMapper: (ChartDataModel data, _) => data.x,
                              name: '',
                              color: FreePaymentUIColors.blueColor,
                              borderColor: FreePaymentUIColors.greenColor,
                              gradient: gradientColors),
                        ],
                      ),
                    ),
                  ],
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
                    const ListItem(),
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

final List<ChartDataModel> _expenses = [
  ChartDataModel('S', 3.5),
  ChartDataModel('M', 3.0),
  ChartDataModel('T', 3.2),
  ChartDataModel('W', 3.3),
  ChartDataModel('TH', 2.4),
  ChartDataModel('F', 3.0),
  ChartDataModel('SA', 3.4),
];
