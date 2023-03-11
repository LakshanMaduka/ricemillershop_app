import 'package:application_1/providers/ChartDataDay.dart';
import 'package:application_1/providers/ChartDataMonth.dart';
import 'package:application_1/screens/tabDayScreen.dart';
import 'package:application_1/screens/tabMonthScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../providers/ListOfBills.dart';
import '../providers/billList.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen>
    with SingleTickerProviderStateMixin {
  // Stream<List<ListOfBills>> readBills() => FirebaseFirestore.instance
  late TabController controller;
  bool isLoading = false;
  bool _isinit = true;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    final billP = Provider.of<BillListprovider>(context, listen: false);

    setState(() {
      isLoading = true;
    });
    if (_isinit) {
      Provider.of<BillListprovider>(context, listen: false)
          .calculateIncomeDay()
          .then((value) => billP.calculateIncomeMonth())
          .then((value) => billP.chartDataDay())
          .then((value) => billP.chartDataMonth())
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isinit = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillListprovider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Income'),
          centerTitle: true,
          bottom: TabBar(controller: controller, tabs: [
            Tab(
              text: 'Daily',
            ),
            Tab(
              text: 'Montly',
            )
          ]),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                controller: controller,
                children: [TabDayScreen(), TabMonthScreen()]));
  }
}
