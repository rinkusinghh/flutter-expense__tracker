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
                color: Colors.orange,
                child: Text(
                  'Chart text!',
                ),
                elevation: 5,
              ),
            ),
            // List of transaction items!
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        transaction.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            transaction.date.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 16),
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
