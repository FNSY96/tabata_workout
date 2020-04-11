import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tabataworkout/time.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class CountDown extends AnimatedWidget {
  CountDown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    return new Text(
      animation.value.toString(),
      style: new TextStyle(fontSize: 150.0),
    );
  }
}

class MyApp extends StatefulWidget {
  State createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  Time timeStorage;
  AnimationController _controller;

  var hours;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(hours: 0, minutes: 0, seconds: timeStorage.seconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.play_arrow),
        onPressed: () => _controller.forward(from: 0.0),
      ),
      body: new Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          FlatButton(
              onPressed: () {
                DatePicker.showTimePicker(context, showSecondsColumn: true,
                    onConfirm: (date) {
                  timeStorage = Time(date);
                  setState(() {

                  });
                  }, currentTime: DateTime.utc(2020, 0), locale: LocaleType.en);
              },
              child: Text(
                'Cycle Time',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              )),
          Row(children: <Widget>[
            new Container(
              child: new Center(
                child: new CountDown(
                  animation: new StepTween(
                    begin: timeStorage.seconds,
                    end: 0,
                  ).animate(_controller),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
