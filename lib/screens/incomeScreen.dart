import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../providers/ListOfBills.dart';
import '../providers/billList.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  // Stream<List<ListOfBills>> readBills() => FirebaseFirestore.instance
  bool isLoading = false;
  bool _isinit = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      isLoading = true;
    });
    if (_isinit) {
      Provider.of<BillListprovider>(context, listen: false)
          .calculateIncomeDay()
          .then((value) => Provider.of<BillListprovider>(context, listen: false)
              .calculateIncomeMonth())
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
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillListprovider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Income'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
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
            : TabView(
                totalIncomD: billProvider.total.toString(),
                totalIncomeM: billProvider.totalM.toString(),
              ),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  String? totalIncomD;
  String? totalIncomeM;
  TabView({
    this.totalIncomD,
    this.totalIncomeM,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      TabBody(
        totalIncom: totalIncomD,
        text: 'අද දින ආදායම',
      ),
      TabBody(
        totalIncom: totalIncomeM,
        text: 'මෙම මස ආදායම',
      ),
    ]);
  }
}

class TabBody extends StatelessWidget {
  String? text;
  TabBody({
    this.text,
    Key? key,
    required this.totalIncom,
  }) : super(key: key);

  final String? totalIncom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              totalIncom!,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      )),
      height: 100,
      color: Colors.cyan,
    );
  }
}
