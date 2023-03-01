import 'package:application_1/components/GridTile.dart';
import 'package:application_1/screens/bottomScreen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../components/ItemTile.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: GridView.count(crossAxisCount: 2, shrinkWrap: true, children: [
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "වී",
                        price: 5.0,
                      )),
              imgName: "vee.png",
              name: "වී",
              color: Colors.red,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "පොල්තෙල්",
                        price: 5.0,
                      )),
              imgName: "polthel.png",
              name: 'පොල්තෙල්',
              color: Colors.blue,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "හාල් පිටි/මුං",
                        price: 5.0,
                      )),
              imgName: "piti.png",
              name: "හාල් පිටි/මුං",
              color: Colors.teal,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "මිරිස්/කහ/සිල්ලර",
                        price: 5.0,
                      )),
              imgName: "miriskudu.png",
              name: 'මිරිස්/කහ/සිල්ලර',
              color: Colors.orange,
            ),
          ]),
        ),
      ),
    );
  }
}
