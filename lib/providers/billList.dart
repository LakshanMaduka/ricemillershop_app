import 'dart:collection';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:application_1/providers/Bill.dart';
import 'package:application_1/providers/ListOfBills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BillListprovider extends ChangeNotifier {
  List<Bill> _bills = [];
  UnmodifiableListView<Bill> get bills {
    return UnmodifiableListView(_bills);
  }

  double? total = 0;
  String? rice = null;
  String? paddy = null;
  String? chilly = null;
  String? coconut = null;

  var mymap = {};
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  // void fireSFunction() async {
  //   CollectionReference ebills = firestore.collection("ebills");
  //   var bList = bills.map((e) => e.toJson()).toList();
  //   await ebills
  //       .doc(DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()))
  //       .set(bList.map((e) => null));
  // }
  Future<void> fireSFunction(
      {String? title,
      String? value,
      String? dateTime,
      double? amount,
      double? total}) async {
    CollectionReference ebills =
        FirebaseFirestore.instance.collection("ebills");
    await ebills
        .doc(DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()))
        .set({
      'day': DateFormat('dd').format(DateTime.now()),
      'month': DateFormat('MM').format(DateTime.now()),
      'dateTilme': DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()),
      'list': bills.map((e) => e.toJson()).toList(),
    });
    //await ebills.doc(DateTime.now().toString()).set({});
  }

  // double get total {
  //   return _total;
  // }

  void addBill(
      {String? title,
      String? value,
      String? dateTime,
      double? amount,
      double? total}) {
    _bills.add(Bill(
        title: title,
        noOfKg: value,
        dateTime: dateTime,
        amount: amount,
        total: total));
    notifyListeners();
  }

  // Stream<List<ListOfBills>> readBills() => FirebaseFirestore.instance
  //     .collection('ebills')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((e) => ListOfBills.fromJson(e.data())).toList());

  void getPrices() {
    // final prices = firestore.collection('prices').doc('prices').get();

    FirebaseFirestore.instance
        .collection('prices')
        .doc('prices')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        rice = data['හාල්-මුං'];
        paddy = data['වී'];
        chilly = data['මිරිස්-සිල්ලර-කහ'];
        coconut = data['පොල්තෙල්'];
      }
    });

    // print(prices);
  }

  void calculateIncomeDay() {
    FirebaseFirestore.instance
        .collection('ebills')
        .where(
          'day',
          isEqualTo: DateFormat('dd').format(DateTime.now()),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.data()['list'].map((e) => total = total! + e['total']).toList();
      });
    });
  }

  void removeTask(int index) {
    _bills.removeAt(index);
    notifyListeners();
  }

  double gettotal() {
    double _total = 0.0;
    for (var element in _bills) {
      _total += element.total!;
    }
    return _total;
  }

  void emtyList() {
    _bills = [];
  }
}
