import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(
          "Your first page",
          style: new TextStyle(fontSize: 25, color: Colors.purple),
        ),
      ),
    );
  }
}
