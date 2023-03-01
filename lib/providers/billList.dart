import 'dart:collection';
import 'dart:convert';
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

  var mymap = {};
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
    CollectionReference ebills = firestore.collection("ebills");
    await ebills
        .doc(DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()))
        .set({
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

  void billListGenerate() {}

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
