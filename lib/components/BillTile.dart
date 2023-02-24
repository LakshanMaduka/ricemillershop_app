import 'package:flutter/material.dart';

class BillTile extends StatelessWidget {
  final String? type;
  final String? dateTime;
  final String? amount;
  final String? total;

  const BillTile({Key? key, this.amount, this.type, this.dateTime, this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          //side: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Color(0xFF80DEEA),
        title: Text(type! + ' ' + amount! + ' Kg '),
        subtitle: Text(dateTime!),
        trailing: Text("රු. " + total!),
      ),
    );
  }
}
