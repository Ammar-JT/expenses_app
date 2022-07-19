// Lesson 4: split app to widgets + managing data between them + make a list inside a column scrollable + ListView + ListView.builder (redner items as we need, not the entire list of items)

// split app to widgets: at first we wanted to split 'the input section' and the 'transactionList' into two widgets and that's it!
  //.. but then we noticed that we have a changing UI which required a stateful parent widget
  //.. we could make main.dart stateful, but بياخة, cuz we don't need to change the top bar and the other scaffold stuff!
  //.. that's why needed a third widget (son of main) and (father of the rest) and this widget is stateful!!
// widgets will be:
  // main.dart <<< stateless
    // user_transaction.dart <<< stateful
      // new_transactoin.dart <<< stateless
      // transaction_list.dart <<< stateless


// managing data between widgets can be done by passing data through a constructors

// column can take full width in the screen, so if it's children overdflow the screen it won't handle it
  //.. the solution simply is to use:
// SingleChildScrollView 
  //.. and put the column inside it

//ListView: you can replace any column wrapped in SingleChildScrollView , with a ListView directally
  //.. cuz it will do the same thing (except that it needs to be wrapped in a container with a hight cuz the height of the listView is inifinite!) 
//And yes, the same thing including the disadvantages!!!
  //.. the main disadvantage is that you have to have the whole list (array or anything)
// To avoid this disadvantage, you can use ListView.builder()!!!!
  //.. the build will render only the item that shown in the screen with a little more
  //.. Go and see it in transaction_list.dart!!!!



  





// ignore_for_file: sort_child_properties_last
import './widgets/user_transactions.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import 'package:flutter/material.dart';

import 'models/transaction.dart';

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
      //we can remove this SingleChildScrollView, but we kept it cuz we needed it for the keyboard scrolling margin
      body: SingleChildScrollView(
        child: Column(
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
