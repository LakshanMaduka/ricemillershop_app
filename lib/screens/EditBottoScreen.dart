import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';class editbottonScreen extends StatefulWidget {
  String? name;
  editbottonScreen({
    this.name,
    Key? key,
  }) : super(key: key);

  @override
  State<editbottonScreen> createState() => _editbottonScreenState();
}

class _editbottonScreenState extends State<editbottonScreen> {
  bool isLoading = false;
  String? newPrice;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
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
                    'නව මිල',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        newPrice = value;
                      });
                    },
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final docPrice = FirebaseFirestore.instance
                          .collection('prices')
                          .doc('prices');
                      await docPrice.update({'${widget.name}': newPrice!});
                      // billProvider.fireSFunction(
                      //     title: widget.name,
                      //     value: totalKg!,
                      //     total: double.parse(totalKg!) * widget.price!,
                      //     dateTime: DateFormat('yyyy-MM-dd  KK:mm:ss')
                      //         .format(DateTime.now()),
                      //     amount: widget.price);
                      // CollectionReference ebills = firestore.collection("ebills");
                      // await ebills.add({'title': 'hello'});

                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, 'settingScreen');
                    },
                    child: const Text('Save'),
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
          );
  }
}
