import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  //a constructor, so we pass data form another widget
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
    );
  }
}
