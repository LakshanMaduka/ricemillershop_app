import 'package:application_1/providers/billList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../components/GridTile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esandi rice miller shop'),
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 2, shrinkWrap: true, children: [
          GTile(
            name: "බිල්පත්",
            icon: Icons.list_alt,
            color: Colors.green,
            function: () => {Navigator.pushNamed(context, 'itemScreen')},
          ),
          GTile(
            name: "ආදායම්",
            icon: Icons.attach_money,
            color: Colors.purple,
            function: (() => Navigator.pushNamed(context, 'incomeScreen')),
          ),
          GTile(
            name: "වියදම්",
            icon: Icons.wallet,
            color: Colors.blue,
          ),
          GTile(
            name: "සැකසුම්",
            icon: Icons.settings,
            color: Colors.pink,
            function: (() => Navigator.pushNamed(context, 'settingScreen')),
          ),
          GTile(
            name: "ලාභය",
            icon: Icons.add_chart,
            color: Colors.orange,
          ),
        ]),
      ),
    );
  }
}
