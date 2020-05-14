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
        child: IconButton(
          onPressed: () {
            print("you clicked it");
          },
          icon: Icon(Icons.alternate_email),
          color: Colors.amberAccent,
        ),
        /* RaisedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.mail),
        label: Text("Mail me"),
        color: Colors.amber,
      )*/
        /*FlatButton(
          //RaisedButton
          onPressed: () {
            print("You clicked me");
          },
          child: Text("Click me!!"),
          color: Colors.lightBlue,
        ),*/
      ),

      /*Center(
        child: Icon(
          Icons.airport_shuttle,
          color: Colors.lightBlue,
          size: 55,
        ),
      ),*/
      //Center(child: Image.network("https://images.unsplash.com/photo-1589396867492-538777c259b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"),),
      /*Center(
        child: Image.asset("assets/space-2.jpg"), //Image(image: AssetImage("assets/space-1.jpg")),
      ),*/
      /*Center(
        child: Image(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1589396867492-538777c259b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80'),
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        child: Text("Click"),
        backgroundColor: Colors.greenAccent,
        onPressed: () {},
      ),
    );
  }
}
