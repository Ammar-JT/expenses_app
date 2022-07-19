import './new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTile, double txAmount) {
    final newTx = Transaction(
      title: txTile,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    // you can use setState cuz this is a stateful widget,
    //.. also you can use .add for a list even if it's final
    //.. but you can assign a new object, only same object same reference, but with added item:
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
