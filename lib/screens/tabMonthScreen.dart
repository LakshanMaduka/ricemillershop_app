import 'package:application_1/providers/ChartDataMonth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/billList.dart';

class TabMonthScreen extends StatelessWidget {
  const TabMonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final billprovider = Provider.of<BillListprovider>(context);
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   text!,
          //   style: const TextStyle(fontSize: 25),
          // ),
          // Text(
          //   'Rs. ${totalIncom!}',
          //   style: const TextStyle(fontSize: 30),
          // ),
          Expanded(
            child: SfCircularChart(
              palette: [
                Color.fromRGBO(51, 102, 204, 1),
                Color.fromRGBO(153, 0, 153, 1),
                Color.fromRGBO(16, 150, 24, 1),
                Color.fromRGBO(253, 190, 25, 1),
                Color.fromRGBO(220, 57, 18, 1),
              ],
              title: ChartTitle(
                  text:
                      "\n මෙම මස ආදායම \n Rs. ${billprovider.totalM!.toStringAsFixed(2)} ",
                  textStyle: TextStyle(fontSize: 20)),
              legend: Legend(
                  position: LegendPosition.bottom,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap),
              series: <CircularSeries>[
                DoughnutSeries<ChartDataMonth, String>(
                    radius: '130',
                    innerRadius: '50',
                    dataSource: billprovider.getChartMonthData(),
                    xValueMapper: (ChartDataMonth data, _) => data.continent,
                    yValueMapper: (ChartDataMonth data, _) => data.gdp,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      )),
    );
  }
}
