import 'package:flutter/material.dart';

class GTile extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Color? color;
  final Function()? function;
  const GTile({
    this.name,
    this.color,
    this.icon,
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
              Icon(
                icon,
                color: Colors.white,
                size: 100,
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
