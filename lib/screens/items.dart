import 'package:application_1/components/GridTile.dart';
import 'package:application_1/screens/bottomScreen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/ItemTile.dart';
import '../providers/billList.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool isLoading = false;
  bool _isinit = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      isLoading = true;
    });
    if (_isinit) {
      Provider.of<BillListprovider>(context, listen: false)
          .getPrices()
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isinit = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillListprovider>(context, listen: false);
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      ITile(
                        function: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomScreen(
                                  name: "වී",
                                  price: double.parse(billProvider.paddy!),
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
                                  price: double.parse(billProvider.coconut!),
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
                                  price: double.parse(billProvider.rice!),
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
                                  price: double.parse(billProvider.chilly!),
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
