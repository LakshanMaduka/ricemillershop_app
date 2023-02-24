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
                        name: "හාල් පිටි",
                        price: 5.0,
                      )),
              imgName: "piti.png",
              name: "හාල් පිටි",
              color: Colors.teal,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "මිරිස් කුඩු",
                        price: 5.0,
                      )),
              imgName: "miriskudu.png",
              name: 'මිරිස් කුඩු',
              color: Colors.orange,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "කෑලි මිරිස්",
                        price: 5.0,
                      )),
              imgName: "kalimiris.png",
              name: 'කෑලි මිරිස්',
              color: Colors.pink,
            ),
            ITile(
              function: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomScreen(
                        name: "කහ කුඩ",
                        price: 5.0,
                      )),
              imgName: "kaha.png",
              name: 'කහ කුඩු',
              color: Colors.purple,
            )
          ]),
        ),
      ),
    );
  }
}
