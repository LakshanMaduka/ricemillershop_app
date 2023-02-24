import 'package:application_1/providers/billList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatefulWidget {
  final String? name;
  final double? price;

  const BottomScreen({Key? key, this.name, this.price}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? totalKg;
  @override
  Widget build(BuildContext context) {
    var billProvider = Provider.of<BillListprovider>(context);

    return Container(
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
                Text(
                  '${widget.name!} 1Kg ක මිල rs.${widget.price!}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'කිලෝ ගණන',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      totalKg = value;
                    });
                  },
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  onPressed: () async {
                    // billProvider.fireSFunction(
                    //     title: widget.name,
                    //     value: totalKg!,
                    //     total: double.parse(totalKg!) * widget.price!,
                    //     dateTime: DateFormat('yyyy-MM-dd  KK:mm:ss')
                    //         .format(DateTime.now()),
                    //     amount: widget.price);
                    // CollectionReference ebills = firestore.collection("ebills");
                    // await ebills.add({'title': 'hello'});
                    billProvider.addBill(
                        title: widget.name,
                        value: totalKg!,
                        total: double.parse(totalKg!) * widget.price!,
                        dateTime: DateFormat('yyyy-MM-dd  KK:mm:ss')
                            .format(DateTime.now()),
                        amount: widget.price);

                    Navigator.pop(context);

                    Navigator.pushNamed(context, "billScreen");
                  },
                  child: const Text('Add'),
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
        ));
  }
}
