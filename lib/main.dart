import 'package:clock/clock.dart';
import 'package:clock/clock_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock App',
      home: AppClock(),
    );
  }
}

class AppClock extends StatefulWidget {
  @override
  _AppClockState createState() => _AppClockState();
}

class _AppClockState extends State<AppClock> {
  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Clock(
              circleColor: Colors.green,
              showBellsAndLegs: true,
              bellColor: Colors.green,
              clockText: _switchVal ? ClockText.roman : ClockText.arabic,
              showHourHandleHeartShape: true,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('roman clock type:'),
                      Switch(
                        onChanged: (value) {
                          setState(() {
                            _switchVal = value;
                          });
                        },
                        value: this._switchVal,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
