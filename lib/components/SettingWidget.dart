import 'package:application_1/providers/billList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PriceTile.dart';

class settingWidget extends StatelessWidget {
  Map<String, dynamic>? data;
  settingWidget({
    this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var billProvider = Provider.of<BillListprovider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                billProvider.calculateProfit();
              },
              child: Text('test')),
          PriceTile(
            name: "වී",
            price: data!["වී"].toString(),
          ),
          PriceTile(
            name: "පොල්තෙල්",
            price: data!["පොල්තෙල්"].toString(),
          ),
          PriceTile(
            name: "මිරිස්-සිල්ලර-කහ",
            price: data!["මිරිස්-සිල්ලර-කහ"].toString(),
          ),
          PriceTile(
            name: "හාල්-මුං",
            price: data!["හාල්-මුං"].toString(),
          ),
          PriceTile(
            name: "හාල්-නිවුඩු",
            price: data!["හාල්-නිවුඩු"].toString(),
          ),
        ],
      ),
    );
  }
}
