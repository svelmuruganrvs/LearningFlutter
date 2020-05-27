import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HTTPRequestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return  MaterialApp(
      home: HTTPDemoApp(),
    );
  }
}

class HTTPDemoApp extends StatefulWidget {
  @override
  _HTTPDemoAppState createState() => _HTTPDemoAppState();
}

class _HTTPDemoAppState extends State<HTTPDemoApp> {
  String url = "https://randomuser.me/api/";

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json",
      },
    );
    // print(response.body);
    List data;
    var extractData = json.decode(response.body);
    data = extractData['results'];
    print(data[0]['name']['first']);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child : new RaisedButton(
        child: new Text("Make Request"),
        onPressed: makeRequest,
      ),
      )
    );
  }
}
