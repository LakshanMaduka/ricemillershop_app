import 'package:application_1/providers/Bill.dart';

class ListOfBills {
  String? dt;
  List<Bill>? list;
  String? day;
  String? month;
  ListOfBills({this.dt, this.list, this.day, this.month});
  static ListOfBills fromJson(Map<String, dynamic> json) {
    return ListOfBills(
        dt: json['dateTime'],
        list: json['list'],
        day: json['day'],
        month: json['month']);
  }
}
