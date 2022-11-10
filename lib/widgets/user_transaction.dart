import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
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

  void _addUserTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Text input fields!
        NewTransaction(),
        // List of transaction items!
        TransactionList(_userTransaction),
      ],
    );
  }
}
