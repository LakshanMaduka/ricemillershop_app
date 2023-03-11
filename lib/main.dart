import 'package:application_1/providers/billList.dart';
import 'package:application_1/providers/prices.dart';
import 'package:application_1/screens/BillScreen.dart';
import 'package:application_1/screens/bill_list_screen.dart';
import 'package:application_1/screens/expensesScreen.dart';
import 'package:application_1/screens/incomeScreen.dart';
import 'package:application_1/screens/items.dart';
import 'package:application_1/screens/mainScreen.dart';
import 'package:application_1/screens/profitScreen.dart';
import 'package:application_1/screens/settingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BillListprovider>(
            create: (context) => BillListprovider()),
        ChangeNotifierProvider<PricesProvider>(
            create: (context) => PricesProvider()),
      ],
      child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              //home: MainScreen(),
              routes: {
                '/': (context) => MainScreen()
                //MainScreen()
                ,
                'itemScreen': (context) => ItemScreen(),
                'billScreen': (context) => BillListScreen(),
                'incomeScreen': (context) => IncomeScreen(),
                'settingScreen': (context) => SettingScreen(),
                'finalBillScreen': (context) => BillScreen(),
                'expensesScreen': (context) => ExpensesScreen(),
                'profitScreen': (context) => ProfitScreen(),
              },
            );
          }),
    );
  }
}
