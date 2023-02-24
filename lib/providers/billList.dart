import 'dart:collection';
import 'dart:convert';
import 'package:application_1/providers/Bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BillListprovider extends ChangeNotifier {
  List<Bill> _bills = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void fireSFunction() async {
    CollectionReference ebills = firestore.collection("ebills");
    await ebills
        .doc(DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()))
        .set({bills.toList()});
  }
  // void fireSFunction(
  //     {String? title,
  //     String? value,
  //     String? dateTime,
  //     double? amount,
  //     double? total}) async {
  //   CollectionReference ebills = firestore.collection("ebills");
  //   await ebills
  //       .doc(DateFormat('yyyy-MM-dd  KK:mm:ss').format(DateTime.now()))
  //       .set({
  //     'title': title,
  //     'value': value,
  //     'dateTime': dateTime,
  //     'amount': amount,
  //     'total': total
  //   });
  //   //await ebills.doc(DateTime.now().toString()).set({});
  // }

  UnmodifiableListView<Bill> get bills {
    return UnmodifiableListView(_bills);
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
