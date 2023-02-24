import 'package:flutter/material.dart';

class ITile extends StatelessWidget {
  final String? name;
  final String? imgName;

  final Color? color;
  final Function()? function;
  const ITile({
    this.name,
    this.color,
    this.imgName,
    this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Image(image: AssetImage('assets/images/' + imgName!)),
              ),
              Text(
                name!,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
