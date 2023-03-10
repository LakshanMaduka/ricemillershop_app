import 'package:application_1/components/billListView.dart';
import 'package:application_1/components/bottomScomp.dart';
//import 'package:application_1/providers/BillList.dart';
import 'package:application_1/providers/billList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class BillListScreen extends StatefulWidget {
  const BillListScreen({Key? key}) : super(key: key);

  @override
  State<BillListScreen> createState() => _BillListScreenState();
}

class _BillListScreenState extends State<BillListScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var billProvider = Provider.of<BillListprovider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('Bill'),
        ),
        //bottomNavigationBar: BottomNavigationBar(items: []),
        body: isLoading
            ? Center(child: const CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: BillView()),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.amber,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(fontSize: 25),
                            ),
                            Consumer<BillListprovider>(
                                builder: (context, value, child) {
                              return Text(
                                "රු. " + value.gettotal().toStringAsFixed(2),
                                style: TextStyle(fontSize: 25),
                              );
                            })
                          ]),
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
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
                            child: const Text('Cancel'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'itemScreen', (route) => false);
                            },
                            child: const Text('Add'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((context) => BottomSComp()));
                              // setState(() {
                              //   isLoading = true;
                              // });
                              // QuickAlert.show(
                              //     text: 'Successfully saved the bill',
                              //     onConfirmBtnTap: () {
                              //       billProvider.emtyList();
                              //       billProvider.calculateIncomeDay();
                              //       Navigator.pop(context);
                              //       Navigator.pushReplacementNamed(
                              //           context, '/');
                              //     },
                              //     context: context,
                              //     type: QuickAlertType.success);

                              // await billProvider.fireSFunction();
                            },
                            child: const Text('Next'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}
