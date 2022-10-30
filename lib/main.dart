import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Items!',
      amount: 800,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Food Items',
      amount: 1000,
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
            // Text input fields!
            Card(
              elevation: 5,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Amount'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add transaction",
                          ),
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 18),
                              foregroundColor: Colors.orange),
                        ),
                      ])),
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
                        '\₹${transaction.amount.toString()}',
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
                            DateFormat().format(transaction.date),
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
