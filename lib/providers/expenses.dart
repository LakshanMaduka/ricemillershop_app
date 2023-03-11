class Expense {
  String? day;
  String? month;
  String? dateTime;
  String? amount;
  String? title;
  Expense({this.amount, this.title, this.day, this.month, this.dateTime});
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "day": day,
      "month": month,
      "amount": amount,
      'dateTime': dateTime
    };
  }

  static Expense fromJason(Map<String, dynamic> json) => Expense(
      title: json['title'],
      day: json['day'],
      dateTime: json['dateTime'],
      month: json['month'],
      amount: json['amount']);
}
