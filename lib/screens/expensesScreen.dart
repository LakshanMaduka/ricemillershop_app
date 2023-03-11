import 'dart:math';

import 'package:application_1/components/bottomExpensesComp.dart';
import 'package:application_1/providers/billList.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expenses.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  bool _isloading = false;
  bool _isinit = true;

  @override
  void initState() {
    final billP = Provider.of<BillListprovider>(context, listen: false);
    print('ssss');
    setState(() {
      _isloading = true;
    });
    if (_isinit) {
      billP
          .calculateDayExpenses()
          .then((value) => billP.calculateMonthExpenses())
          .then((value) {
        setState(() {
          _isloading = false;
        });
      });
    }
    _isinit = false;

    super.initState();
    ;
  }

  @override
  Widget build(BuildContext context) {
    var md = MediaQuery.of(context).size;
    final billProvider = Provider.of<BillListprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        centerTitle: true,
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder(
              stream: billProvider.getExpenses(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final expenses = snapshot.data!;

                  return buildBody(
                      md: md,
                      context: context,
                      expense: expenses,
                      bill: billProvider,
                      isLoading: _isloading);
                } else if (snapshot.hasError) {
                  return Text("Something went wrong ${snapshot.error}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
    );
  }
}

Widget buildBody(
    {context,
    md,
    List<Expense>? expense,
    BillListprovider? bill,
    bool? isLoading}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff03045e)),
              height: md.height * 0.25,
              child: Center(
                child: Text(
                  'අද දින වියදම් \n Rs. ${bill!.totalDayExpense!.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff0077b6)),
              height: md.height * 0.25,
              child: Center(
                  child: Text(
                'මෙම මස වියදම් \n Rs. ${bill.totalMonthExpense!.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              )),
            ),
          ),
        ],
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color(0xff0077b6)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: ListView.builder(
              itemCount: expense!.length,
              itemBuilder: (_, count) {
                return Card(
                  child: ListTile(
                    title: Text(expense[count].title!),
                    subtitle: Text(expense[count].dateTime!),
                    trailing: Text("Rs. " +
                        double.parse(expense[count].amount!)
                            .toStringAsFixed(2)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      Container(
        child: ElevatedButton.icon(
          icon: Icon(Icons.post_add_outlined),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => BottomExComp());
          },
          label: Text(
            'Add Expense',
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0077b6),
              minimumSize: Size(double.infinity, md.height * 0.08)),
        ),
      )
    ],
  );
}
