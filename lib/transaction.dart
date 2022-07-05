//import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //Notice we used named args instead of position args, simply use:
        //Transaction({this.a,this.b, ...}
    //not:
        //Transaction(this.a, this.b, ...)
  Transaction({
    //you can use @required but you have to import foundation.dart
    //.. but also i found required (without @), i donno if it's the same
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
