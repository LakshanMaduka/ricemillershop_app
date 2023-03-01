import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ListTile(
              shape: RoundedRectangleBorder(
                //<-- SEE HERE
                //side: BorderSide(width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Color(0xFF80DEEA),
              title: Text('vee' + ' ' + '1 Kg =' + 'rs.10'),
              trailing: IconButton(
                tooltip: "Edit",
                icon: Icon(Icons.edit),
                onPressed: () => {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
