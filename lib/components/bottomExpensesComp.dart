import 'package:application_1/providers/billList.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomExComp extends StatefulWidget {
  const BottomExComp({Key? key}) : super(key: key);

  @override
  State<BottomExComp> createState() => _BottomExCompState();
}

class _BottomExCompState extends State<BottomExComp> {
  String? expenseAmount;
  String? expenseTitle;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillListprovider>(context, listen: false);
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            color: const Color(0xff757575),
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Title',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          expenseTitle = value;
                        });
                      },
                      autofocus: true,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          expenseAmount = value;
                        });
                      },
                      autofocus: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        await billProvider.setExpenses(
                            day: DateFormat('dd').format(DateTime.now()),
                            month: DateFormat('MM').format(DateTime.now()),
                            amount: expenseAmount,
                            title: expenseTitle);

                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, 'expensesScreen');
                      },
                      child: Text('Save Expence'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 400,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
