import 'package:flutter/material.dart';

import '../screens/EditBottoScreen.dart';
import '../screens/settingScreen.dart';
class PriceTile extends StatelessWidget {
  String? price;
  String? name;
  PriceTile({
    this.price,
    this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          //side: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Color(0xFF80DEEA),
        title: Text(
          name! + ' ' + '1 Kg = ' + 'රු ' + price!,
          style: TextStyle(fontSize: 20),
        ),
        trailing: IconButton(
          tooltip: "Edit",
          icon: Icon(Icons.edit),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => editbottonScreen(
              name: name,
            ),
          ),
        ),
      ),
    );
  }
}