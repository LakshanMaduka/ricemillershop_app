import 'package:application_1/providers/billList.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSComp extends StatefulWidget {
  const BottomSComp({Key? key}) : super(key: key);

  @override
  State<BottomSComp> createState() => _BottomSCompState();
}

class _BottomSCompState extends State<BottomSComp> {
  String? recievedAmount;

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillListprovider>(context, listen: false);
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
                const Text(
                  'දුන් මුදල',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      recievedAmount = value;
                    });
                  },
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  onPressed: () {
                    billProvider.calculateChange(recievedAmount);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'finalBillScreen');
                  },
                  child: Text('Save Bill'),
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
