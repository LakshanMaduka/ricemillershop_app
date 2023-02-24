import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../components/GridTile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esandi vee mola'),
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