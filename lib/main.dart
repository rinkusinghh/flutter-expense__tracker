import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Weekly Grocery!',
      amount: 77.7,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Items!',
      amount: 16.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Food Items',
      amount: 10,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
      ),
      body: Column(
          // enum:- Is a couple of different values!
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Chart text!
            Container(
              width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 57, 228, 186),
                child: Text(
                  'Chart text!',
                ),
                elevation: 5,
              ),
            ),
            // Transaction items!
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      child: Text(
                        transaction.amount.toString(),
                      ),
                    ),
                    Column(children: <Widget>[
                      Text(transaction.title),
                      Text(
                        transaction.date.toString(),
                      )
                    ])
                  ]),
                );
              }).toList(),
            )
          ]),
    );
  }
}
