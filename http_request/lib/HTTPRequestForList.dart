import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;

class HTTPListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://randomuser.me/api/?results=15";
  List data;

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json",
      },
    );
    setState(() {
      var extractData = json.decode(response.body);
      data = extractData['results'];
    });
  }

  @override
  void initState() {
    this.makeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contact List"),
        ),
        body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i) {
            return new ListTile(
              title: new Text(data[i]["name"]['first'] ?? ""),
              subtitle: new Text(data[i]['phone'] ?? ""),
              leading: new CircleAvatar(
                backgroundImage:
                    new NetworkImage(data[i]['picture']['thumbnail']),
              ),
              onTap: () {

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PhotoViewer(data[i])));
              },
            );
          },
        ));
  }
}

class PhotoViewer extends StatelessWidget {
  final data;
  PhotoViewer(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        width: 150.0,
        height: 150.0,
        decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: new NetworkImage(data['picture']['large']),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
            border: new Border.all(color: Colors.red, width: 4.0)),
      ),
    );
  }
}
