import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/billList.dart';

class ProfitScreen extends StatefulWidget {
  const ProfitScreen({super.key});

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
  bool isLoading = false;
  bool _isinit = true;

  @override
  void didChangeDependencies() {
    final billP = Provider.of<BillListprovider>(context, listen: false);

    setState(() {
      isLoading = true;
    });
    if (_isinit) {
      Provider.of<BillListprovider>(context, listen: false)
          .calculateProfit()
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isinit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context).size;
    final billP = Provider.of<BillListprovider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profit'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff03045e)),
                      height: md.height * 0.25,
                      child: Center(
                        child: Text(
                          'අද දින ලාභය \n Rs. ${billP.totalProfitDay!.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff0077b6)),
                      height: md.height * 0.25,
                      child: Center(
                          child: Text(
                        'මෙම මස ලාභය \n Rs. ${billP.totalProfitMonth!.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
