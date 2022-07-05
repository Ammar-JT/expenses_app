// Lesson 2: Custom Class (not widget) + Mapping + Basic Styling:

// - made a custom class named: Transaction.dart <<< go and see it
// - applied a mapping into the list of transaction <<< search for: transactions.map((tx)
// - styling in Flutter:
      //- you don't have a stylesheet or styling in the head like css
      //.. instead, all the styling happend in the widget arguments (like inline in css)

// - Styled the transactions cards:
      //- used margin + decoration + padding
      //- text styling
      //- crossAxisAlignment
      //- go and see it

import 'package:flutter/material.dart';

import './transaction.dart';

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
  //a list of transaction:
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Begala',
      amount: 15.55,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              color: Colors.blue,
              child: Text('Charts!'),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Column(
            // children: [],
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,

                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title, 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              //why toList()? cuz the parent (Column) need from children to be a list []:
            }).toList(),
          ),
        ],
      ),
    );
  }
}
