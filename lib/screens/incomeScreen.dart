import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../providers/ListOfBills.dart';
import '../providers/billList.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key? key}) : super(key: key);
  // Stream<List<ListOfBills>> readBills() => FirebaseFirestore.instance
  //     .collection('ebills')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((e) => ListOfBills.fromJson(e.data())).toList());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Income'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: 'Daily',
            ),
            Tab(
              text: 'Montly',
            )
          ]),
        ),
        body: FutureBuilder<ListOfBills?>(
            future: readBills(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final bills = snapshot.data!;
                print(bills.dt);
                // double? totalSum;
                // bills.map((e) {
                //   e.list!.forEach((element) {
                //     totalSum = (totalSum! + element.total!);
                //   });
                // });
                return TabView();
              } else if (snapshot.hasError) {
                return Text("has an error");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<ListOfBills?> readBills() async {
    final docBill = FirebaseFirestore.instance
        .collection('ebills')
        .doc('2023-02-26 06:11:59');
    final snapshot = await docBill.get();

    if (snapshot.exists) {
      return ListOfBills.fromJson(snapshot.data()!);
    }
  }
}

class TabView extends StatelessWidget {
  String? totalIncom;
  TabView({
    this.totalIncom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Container(
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
                'අද දින ආදායම',
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
      ),
      Container(
        height: 250,
        color: Colors.cyan,
      ),
    ]);
  }
}
