import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class ChartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChartApp(),
    );
  }
}

class ChartApp extends StatefulWidget {
  @override
  _ChartAppState createState() => _ChartAppState();
}

class _ChartAppState extends State<ChartApp> {
  final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(250.0, 250.0);
  Color labelColor = Colors.blue;

  Stopwatch watch = Stopwatch();
  Timer timer;
  String elapsedTime = '';

  List<CircularStackEntry> _generateChartData(int min , int sec) {
    double temp = sec * 0.6;
    double adjustedSeconds = (sec + temp) % 100;

    Color dialColor = Colors.blue;

    labelColor = dialColor;
    List<CircularStackEntry> data = [
      new CircularStackEntry(
        [
          new CircularSegmentEntry(adjustedSeconds, dialColor)
        ]
      )
    ];
    return data;
  }
  updateTime(Timer timer) {
    if (watch.isRunning) {
      var milliseconds = watch.elapsedMilliseconds;
      int hunderds = (milliseconds / 10 ). truncate();
      int seconds = (hunderds / 100).truncate();
      int minutes  = (seconds / 60 ).truncate();

      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
        List<CircularStackEntry> data = _generateChartData(minutes, seconds);
        _chartKey.currentState.updateData(data);
      });
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chart Demo"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Container(
              child : new AnimatedCircularChart(
                key : _chartKey,
                size: _chartSize,
                initialChartData: _generateChartData(0 , 0),
                chartType: CircularChartType.Radial,
                edgeStyle: SegmentEdgeStyle.round,
                percentageValues: true,
                holeLabel: elapsedTime,
                labelStyle: _labelStyle,
                )
            ),
            // new Text(
            //   elapsedTime,
            //   style: TextStyle(fontSize: 25.0),
            // ),
            SizedBox(height: 20.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.play_arrow),
                  onPressed: startWatch,
                ),
                SizedBox(width: 20.0,),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: new Icon(Icons.stop),
                  onPressed: stopWatch,
                ),
                SizedBox(width: 20.0,),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: new Icon(Icons.refresh),
                  onPressed: resetWatch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 500), updateTime);
    
  }

  stopWatch() {
    watch.stop();
    setTime();

  }
  resetWatch() {
    watch.reset();
    setTime();
  }

  setTime(){
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hunderds = (milliseconds / 10 ). truncate();
    int seconds = (hunderds / 100).truncate();
    int minutes  = (seconds / 60 ).truncate();
    
    String minutesString = (minutes % 60 ).toString().padLeft(2 , '0');
    String secondsString = (seconds % 60 ).toString().padLeft(2 , '0');
    String hundredsString = (hunderds % 100 ).toString().padLeft(2 , '0');
    return "$minutesString : $secondsString : $hundredsString";
  } 
}
