import 'package:flutter/material.dart';
import 'About.dart';

class SideMenuAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SideMenuApp(),
    );
  }
}

class SideMenuApp extends StatefulWidget {
  @override
  _SideMenuAppState createState() => _SideMenuAppState();
}

class _SideMenuAppState extends State<SideMenuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Side Menu"),
      ),
      drawer: new Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text("Velmurugan"),
            accountEmail: Text("velmurugan@mailinator.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
            ),
          ),
          new ListTile(
            title: Text("About Page"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage()),
              );
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5.0,
          ),
          new ListTile(
            title: Text("About Page"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage()),
              );
            },
          )
        ],
      )),
    );
  }
}
