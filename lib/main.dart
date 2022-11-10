import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
      ),
      body: Column(
        // enum:- Is a couple of different values!
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Chart text!
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.orange,
              child: Text(
                'Chart text!',
              ),
              elevation: 5,
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
