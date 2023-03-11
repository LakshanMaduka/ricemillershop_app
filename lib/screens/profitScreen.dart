import 'package:flutter/material.dart';

class ProfitScreen extends StatelessWidget {
  const ProfitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profit'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 10, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff03045e)),
                height: md.height * 0.25,
                child: Center(
                  child: Text(
                    'අද දින වියදම් \n Rs. 100',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff0077b6)),
                height: md.height * 0.25,
                child: Center(
                    child: Text(
                  'මෙම මස වියදම් \n Rs. 2000',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
