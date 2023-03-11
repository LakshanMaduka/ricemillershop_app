import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/ChartDataDay.dart';
import '../providers/billList.dart';

class TabDayScreen extends StatelessWidget {
  const TabDayScreen({super.key});

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
                      "\nඅද දින ආදායම \n Rs. ${billprovider.total!.toStringAsFixed(2)} ",
                  textStyle: TextStyle(fontSize: 20)),
              series: <CircularSeries>[
                DoughnutSeries<ChartDataDay, String>(
                    radius: '130',
                    innerRadius: '50',
                    dataSource: billprovider.getChartDayData(),
                    xValueMapper: (ChartDataDay data, _) => data.continent,
                    yValueMapper: (ChartDataDay data, _) => data.gdp,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
              legend: Legend(
                  position: LegendPosition.bottom,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap),
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
