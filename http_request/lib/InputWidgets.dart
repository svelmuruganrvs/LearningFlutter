import 'package:flutter/material.dart';

class InputWidgetPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputWidgetPage(),
    );
  }
}

class InputWidgetPage extends StatefulWidget {
  @override
  _InputWidgetPageState createState() => _InputWidgetPageState();
}

class _InputWidgetPageState extends State<InputWidgetPage> {
  String inputStr = "";
  final myController = TextEditingController();
  var enabled = false;
  var expanded = false;
  var checked = false;
  String radioValue;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Input Widget"),
      ),
      body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
                //obscureText: true,
                controller: myController,
                decoration: InputDecoration(hintText: 'Enter your name'),
                onChanged: (String textinput) {
                  setState(() {
                    inputStr = myController.text.length.toString();
                  });
                }),
            new Text(inputStr),
            new Switch(
              value: enabled,
              onChanged: (bool val) {
                setState(() {
                  enabled = val;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
            ),
            new ExpansionPanelList(
              expansionCallback: (i, bool val) {
                setState(() {
                  expanded = !val;
                });
              },
              children: [
                new ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Hello"),
                  ),
                  headerBuilder: (BuildContext context, bool val) {
                    return new Center(
                      child: new Text(
                        "Tap on me",
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    );
                  },
                  isExpanded: expanded,
                ),
              ],
            ),
            new Checkbox(
              value: checked,
              activeColor: Colors.purple,
              onChanged: (bool val) {
                setState(() {
                  checked = val;
                });
              },
            ),
            new Row(
              children: <Widget>[
                new Radio(
                  value: "First", 
                 groupValue: radioValue, 
                 activeColor: Colors.red,
                 onChanged: (String val){
                  setRadioValue(val);
                }),
                new Radio(
                  value: "Second", 
                 groupValue: radioValue, 
                 activeColor: Colors.amber,
                 onChanged: (String val){
                  setRadioValue(val);
                }),
                new Radio(
                  value: "Third", 
                 groupValue: radioValue, 
                 activeColor: Colors.red,
                 onChanged: (String val){
                  setRadioValue(val);
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  setRadioValue (String value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }
}
