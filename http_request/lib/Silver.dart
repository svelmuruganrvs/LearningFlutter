import 'package:flutter/material.dart';

class SilverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SilverPage(),
    );
  }
}

class SilverPage extends StatefulWidget {
  @override
  _SilverPageState createState() => _SilverPageState();
}

class _SilverPageState extends State<SilverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text("Sliver"),
            floating: true,
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.network("https://placeimg.com/480/320/any"),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context , index) =>
              new Card(
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: new NetworkImage("https://placeimg.com/640/480/animals"),
                      ),
                      SizedBox(width: 10.0,),
                      Text("I am the card content")
                    ],
                  ),
                ),
              )
            )
          )
        ],
      ),
    );
  }
}