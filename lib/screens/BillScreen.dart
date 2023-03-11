import 'package:application_1/components/BillListView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../providers/billList.dart';

class BillScreen extends StatefulWidget {
  BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var _md = MediaQuery.of(context);
    final availableHeight =
        _md.size.height - _md.padding.bottom - _md.padding.top;

    final availableWidth = MediaQuery.of(context).size.width;
    final billProvider = Provider.of<BillListprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)),
                        height: availableHeight * 0.87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Bill',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                height: availableHeight * 0.5,
                                child: const BillView()),
                            const Divider(
                              indent: 20,
                              endIndent: 20,
                              height: 2,
                              thickness: 2,
                            ),
                            ListTile(
                              dense: true,
                              title: const Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                'Rs.' +
                                    billProvider.totalBill!.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(
                              height: 2,
                              indent: 20,
                              endIndent: 20,
                            ),
                            ListTile(
                              dense: true,
                              title: const Text(
                                'Cash',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                'Rs.' +
                                    double.parse(billProvider.cash!)
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              height: 2,
                              indent: 15,
                              endIndent: 15,
                            ),
                            ListTile(
                              dense: true,
                              title: const Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                'Rs.' + billProvider.change!.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              height: 2,
                              indent: 15,
                              endIndent: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: availableHeight * 0.1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                billProvider.emtyList();
                                QuickAlert.show(
                                    text: 'Do you want to cancel the bill?',
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/', (route) => false);
                                    },
                                    context: context,
                                    type: QuickAlertType.confirm);
                              },
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  minimumSize: Size(availableWidth * 0.45,
                                      availableHeight * 0.09)),
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Cancel',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await billProvider.fireSFunction();
                                QuickAlert.show(
                                    text: 'Successfully saved the bill',
                                    onConfirmBtnTap: () {
                                      billProvider.emtyList();
                                      billProvider.calculateIncomeDay();
                                      Navigator.pop(context);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/', (route) => false);
                                    },
                                    context: context,
                                    type: QuickAlertType.success);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  minimumSize: Size(availableWidth * 0.45,
                                      availableHeight * 0.09)),
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
