import 'package:admin/bar_chart/bar_chart.dart';
import 'package:admin/controllers/drawer_index_controller.dart';
import 'package:admin/pie_chart/pie_chart.dart';
import 'package:admin/screens/dashboard/components/date_search.dart';
import 'package:admin/screens/dashboard/components/date_search_report.dart';
import 'package:admin/screens/dashboard/components/report_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final indexController=context.watch<DrawerIndexController>();
    return SafeArea(
      child: Column(
        children: [
          Header(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child:indexController.index==0? Column(
                children: [
                  SizedBox(height: defaultPadding),
                  DateSearch(),
                  SizedBox(height: 32,),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                // RegionReport(),
                                // SizedBox(height: defaultPadding),
                                // // RecentFiles(),
                                // if (Responsive.isMobile(context))
                                //   SizedBox(height: defaultPadding),
                                // if (Responsive.isMobile(context)) StarageDetails(),
                                PieChartWidget()
                              ],
                            ),
                          ),
                          // if (!Responsive.isMobile(context))
                          //   SizedBox(width: defaultPadding),
                          // // On Mobile means if the screen is less than 850 we dont want to show it
                          // if (!Responsive.isMobile(context))
                          //   Expanded(
                          //     flex: 2,
                          //     child: StarageDetails(),
                          //   ),
                          Expanded(child: BarChartWidget())
                        ],
                      ),
                    ),
                  )
                ],
              ):Container(child: Column(
                children: [
                  DateSearchReport(),
                  SizedBox(height: 32,),
                  Expanded(child: ReportTable())
                ],
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
