import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Text(
          "Hello Ninjas!!!",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.grey[600],
              fontFamily: "IndieFlower"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Click"),
        backgroundColor: Colors.greenAccent,
        onPressed: () {},
      ),
    );
  }
}
