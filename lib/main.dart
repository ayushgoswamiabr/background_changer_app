import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colors = [
    Colors.teal,
    Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.primaries,
    Colors.redAccent
  ];

  var currentcolor = Colors.white;
  var currentbuttoncolor = Colors.black;

  Timer _timer;
  int _start = 10;

  void starttimer() {
    const onsec = const Duration(seconds: 1);
    _timer = Timer.periodic(
        onsec,
        (timer) => setState(() {
              if (_start < 1) {
                _start = 10;
                starttimer();
              } else {
                _start = _start - 1;
                changeColor(_start);
              }
            }));
  }

  int index;
  Color colorrightnow;

  void changeColor(int _start) {
    setState(() {
      currentcolor = colors[_start];
    });
  }

  void changeBackground() {
    int random = Random().nextInt(colors.length);
    int randombuttoncolor = Random().nextInt(colors.length);
    setState(() {
      currentcolor = colors[random];
      currentbuttoncolor = colors[randombuttoncolor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: Container(
          color: currentcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  RaisedButton(
                    color: currentbuttoncolor,
                    child: Text(
                      "Change Me",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    onPressed: changeBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: currentbuttoncolor,
                    child: Text(
                      "Auto Change",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    onPressed: () {
                      starttimer();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
