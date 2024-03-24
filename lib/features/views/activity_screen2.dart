import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freepaymentuikit_kole/components/activity_screen2.dart';
import 'package:freepaymentuikit_kole/components/top_row_widget.dart';
import 'package:freepaymentuikit_kole/constants/asset_path.dart';
import 'package:freepaymentuikit_kole/constants/colors.dart';
import 'package:freepaymentuikit_kole/features/models/chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              SizedBox(
                height: 250.h,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  borderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    isInversed: false,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                    axisLine: const AxisLine(width: 0),
                    majorGridLines: const MajorGridLines(width: 0),
                    labelIntersectAction: AxisLabelIntersectAction.rotate90,
                  ),
                  primaryYAxis: const NumericAxis(
                    minimum: 1,
                    maximum: 4,
                    interval: 1,
                    isVisible: true,
                    opposedPosition: true,
                    axisLine: AxisLine(width: 0),
                    labelFormat: '\${value}k',
                    majorGridLines: MajorGridLines(
                      width: 1,
                      dashArray: [10, 10],
                    ),
                  ),
                  // tooltipBehavior: _tooltip,
                  series: [
                    ColumnSeries<ChartDataModel, String>(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      width: 0.5,
                      spacing: 0.2,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      dataSource: _income,
                      yValueMapper: (ChartDataModel data, _) => data.y,
                      xValueMapper: (ChartDataModel data, _) => data.x,
                      name: '',
                      color: FreePaymentUIColors.greenColor,
                    ),
                    ColumnSeries<ChartDataModel, String>(
                      width: 0.5,
                      spacing: 0.2,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      dataSource: _expense,
                      yValueMapper: (ChartDataModel data, _) => data.y,
                      xValueMapper: (ChartDataModel data, _) => data.x,
                      name: '',
                      color: FreePaymentUIColors.blueColor,
                    )
                  ],
                ),
              ),

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

              // Category List Scrow
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

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

final List<ChartDataModel> _income = [
  ChartDataModel('Dec 27', 2.2),
  ChartDataModel('Dec 28', 3.2),
  ChartDataModel('Dec 29', 3.8),
  ChartDataModel('Dec 30', 3.0),
  ChartDataModel('Dec 31', 3.2),
];

final List<ChartDataModel> _expense = [
  ChartDataModel('Dec 27', 2.5),
  ChartDataModel('Dec 28', 2.7),
  ChartDataModel('Dec 29', 3.5),
  ChartDataModel('Dec 30', 2.8),
  ChartDataModel('Dec 31', 2.0),
];
