class Bill {
  final String? title;
  final String? noOfKg;
  final String? dateTime;
  final double? total;
  final double? amount;
  Bill({this.title, this.amount, this.dateTime, this.total, this.noOfKg});
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "noOfKg": noOfKg,
      "dateTime": dateTime,
      "total": total,
      "amount": amount
    };
  }
}
