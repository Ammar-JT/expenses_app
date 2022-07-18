// Lesson 3: String Interpolation + Installing external Packages + TextField (input) Widget + fetching (input) data

//- String Interpolation is combining string with dart variables:
// instead of
// 'first: ' + theVariable
//.. you could use the string interpolation:
// 'first: ${theVariable}'

//- install external package:
// we want a third-party lib for formatting date, so we used this one and install it by this line:
// flutter pub add intl
// and then import it

//- TextField (input) widget, go and see it down there

//- fetching data:
// you ether make a global variable (naming might be wrong), and then store values to it when user type
//.. so you can use this value to submit the form or anything
// Or use the TextEdittingController()s

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // String titleInput = '';
  // String amountInput = '';
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              color: Colors.blue,
              child: const Text('Charts!'),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val) => titleInput = val,
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged: (val) {
                    //   amountInput = val;
                    // },
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {
                      // print(titleInput);
                      // print(amountInput);
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
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
                        // '\$' + tx.amount.toString(), <<< instead of this we used String Interpolation
                        '\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          // tx.date.toString(),
                          // DateFormat('yyyy-MM-dd').format(tx.date),
                          DateFormat.yMMMMd().format(tx.date),

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
