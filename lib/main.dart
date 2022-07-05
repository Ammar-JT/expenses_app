// Lesson 1: Expenses App main structure + Column + Rows

// - Expenses App
// - Column and rows
// - mainAxisAlignment for column (up to down axis)
// - mainAxisAlignment for row (left to right)
// - crossAxisAlignment is the crossing axis, it's logical i won't explain it!

// - MainAxisAlignment.something <<< change something and see all the options

// - CrossAxisAlignment.strech <<< use this so you don't need to put a container with full width above every column's child cards!



import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        //mainAxis fo
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            //we used container here to make the card has full width (using double.infinity)
            //.. cuz card take its child width, and text take its parents width,
            //.. that's why you need container in the middle, or even above card:
            child: Container(
              color: Colors.blue,
              child: Text('Charts!'),
              width: double.infinity,
              ),
            elevation: 5,
          ),
          Card(
            child: Text('List of transactions'),
          ),
        ],
      ),
    );
  }
}