import 'package:application_1/components/BillTile.dart';
import 'package:application_1/providers/billList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillView extends StatelessWidget {
  const BillView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var billProvider = Provider.of<BillListprovider>(context);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: billProvider.bills.length,
        itemBuilder: (context, index) => BillTile(
              type: billProvider.bills[index].title,
              amount: billProvider.bills[index].noOfKg,
              dateTime: billProvider.bills[index].dateTime.toString(),
              total: billProvider.bills[index].total!.toStringAsFixed(2),
            ));
  }
}
