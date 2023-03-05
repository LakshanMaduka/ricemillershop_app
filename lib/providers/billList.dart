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

  String? rice = null;
  String? paddy = null;
  String? chilly = null;
  String? coconut = null;
  String? niwudu = null;

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
      'cash': cash,
      'change': change
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

  Future getPrices() async {
    // final prices = firestore.collection('prices').doc('prices').get();

    await FirebaseFirestore.instance
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
        niwudu = data['හාල්-නිවුඩු'];
      }
    });

    // print(prices);
  }

  String? cash = '0';
  double? change = 0;
  void calculateChange(String? value) {
    cash = value;
    change = double.parse(cash!) - gettotal();
  }

  double? total = 0;
  double? totalM = 0;
  Future calculateIncomeDay() async {
    total = 0;
    await FirebaseFirestore.instance
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
    notifyListeners();
  }

  Future calculateIncomeMonth() async {
    totalM = 0;
    await FirebaseFirestore.instance
        .collection('ebills')
        .where(
          'month',
          isEqualTo: DateFormat('MM').format(DateTime.now()),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element
            .data()['list']
            .map((e) => totalM = totalM! + e['total'])
            .toList();
      });
    });
    notifyListeners();
  }

  double? totalPaddyD;
  double? totalChillyD;
  double? totalRiceD;
  double? totalCoconutD;
  double? totalNiwuduD;

  Future chartDataDay() async {
    totalPaddyD = 0;
    totalChillyD = 0;
    totalRiceD = 0;
    totalCoconutD = 0;
    totalNiwuduD = 0;
    await FirebaseFirestore.instance
        .collection('ebills')
        .where(
          'day',
          isEqualTo: DateFormat('dd').format(DateTime.now()),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.data()['list'].map((e) {
          if (e['title'] == 'වී') {
            totalPaddyD = totalPaddyD! + e['total'];
          } else if (e['title'] == 'හාල් පිටි/මුං') {
            totalRiceD = totalRiceD! + e['total'];
          } else if (e['title'] == 'මිරිස්/කහ/සිල්ලර') {
            totalChillyD = totalChillyD! + e['total'];
          } else if (e['title'] == 'පොල්තෙල්') {
            totalCoconutD = totalCoconutD! + e['total'];
          } else if (e['title'] == 'හාල් නිවුඩු') {
            totalNiwuduD = totalNiwuduD! + e['total'];
          }
          ;
        }).toList();
      });
    });
    print(totalPaddyD);
    print(totalRiceD);
    print(totalChillyD);
    print(totalCoconutD);
    print(totalNiwuduD);
    print(' ');
    notifyListeners();
  }

  double? totalPaddyM;
  double? totalChillyM;
  double? totalRiceM;
  double? totalCoconutM;
  double? totalNiwuduM;

  Future chartDataMonth() async {
    totalPaddyM = 0;
    totalChillyM = 0;
    totalRiceM = 0;
    totalCoconutM = 0;
    totalNiwuduM = 0;
    await FirebaseFirestore.instance
        .collection('ebills')
        .where(
          'month',
          isEqualTo: DateFormat('MM').format(DateTime.now()),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.data()['list'].map((e) {
          if (e['title'] == 'වී') {
            totalPaddyM = totalPaddyM! + e['total'];
          } else if (e['title'] == 'හාල් පිටි/මුං') {
            totalRiceM = totalRiceM! + e['total'];
          } else if (e['title'] == 'මිරිස්/කහ/සිල්ලර') {
            totalChillyM = totalChillyM! + e['total'];
          } else if (e['title'] == 'පොල්තෙල්') {
            totalCoconutM = totalCoconutM! + e['total'];
          } else if (e['title'] == 'හාල් නිවුඩු') {
            totalNiwuduM = totalNiwuduM! + e['total'];
          }
          ;
        }).toList();
      });
    });
    print(totalPaddyM);
    print(totalRiceM);
    print(totalChillyM);
    print(totalCoconutM);
    print(totalNiwuduM);
    notifyListeners();
  }

  void removeTask(int index) {
    _bills.removeAt(index);
    notifyListeners();
  }

  double? totalBill;

  double gettotal() {
    double _total = 0.0;
    for (var element in _bills) {
      _total += element.total!;
    }
    totalBill = _total;
    return _total;
  }

  void emtyList() {
    _bills = [];
  }
}
