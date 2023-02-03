import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  String name;
  int number;
  ListCard(this.number, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(1),
      child: Text(
        "${number + 1}. " + name,
        style: TextStyle(fontSize: 20),
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
    );
  }
}
