import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ListDemo(),
    );
  }
}

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: new ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemBuilder: (context, i) {
          return ListTile(
            title: new Text("Some Title"),
            subtitle: new Text(
              "A Subtitle",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            leading: Icon(Icons.face),
            trailing: new RaisedButton(
              child: new Text("Remove"),
              onPressed: () {
                deleteDialog(context).then(
                  (value) {
                    print("Values is $value");
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text("Are you sure ?"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: new Text("Yes"),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: new Text("No"),
          ),
        ],
      );
    },
  );
}