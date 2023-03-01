import 'package:application_1/providers/Bill.dart';

class ListOfBills {
  String? dt;
  List<Bill>? list;
  ListOfBills({this.dt, this.list});
  static ListOfBills fromJson(Map<String, dynamic> json) {
    return ListOfBills(dt: json['dateTime'], list: json['list']);
  }
}
