// Lesson 5: Styling input and output fields + AppBar buttons and floating action buttons + bottom modal + themes + textTheme with exception

// Styling input fields and output
  // '\$${transactions[index].amount.toStringAsFixed(2)}'
  // keyboardType: TextInputType.number,
  // onSubmitted: (_) => submitData,

// AppBar buttons and floating action buttons:
  // return Scaffold( appBar: AppBar(actions: <Widget>[IconButton()],))
  // return Scaffold( floatingActionButton: FloatingActionButton(),)

// Bottom Modal:
  //ShowModalBottomSheet(context, builder(context){}) << to show the modal obviously
  // context: is a context which never been explained before :/
  // builder(context){} is a function that will return a widget inside the modal

// Themes:
  // simply just put it in MaterialApp in the main app:
  // theme: ThemeData()

// fonts:
  // 1- download the font
  // 2- put it in root/fonts or root/assets/fonts but not in the lib
  // 3- import it in the pubspec.yaml
  // 4- put it in the theme in main

// textTheme with exception:
  // ThemeData.light().textTheme.copyWith() <<< this to use the already-defined ThemeData and change only what inside .copyWith()



// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            //headline6 instead of title
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    //as you can see here we passed the BuildContext from the widget and used it in the context of the modal
    showModalBottomSheet(
      context: ctx,
      //the context of the builder is unused here, that's why we wrote it: _
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
