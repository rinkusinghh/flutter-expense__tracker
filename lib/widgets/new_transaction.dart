import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_flatButton.dart';

class NewTransaction extends StatefulWidget {
  final Function AddTxn;
  NewTransaction(this.AddTxn) {
    print('Construction new newTransaction widget!');
  }

  @override
  _NewTransactionState createState() {
    print('createState new Transaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate; // DateTime

  _NewTransactionState() {
    print('Construtor newTransaction state!');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitBtn() {
    // if (_amountController.text.isEmpty) {
    //   return;
    // }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 /* || _selectedDate == null */) {
      return;
    }
    widget.AddTxn(
      enteredTitle,
      enteredAmount, /* _selectedDate */
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((_pickedDate) {
      if (_pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate == _pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                keyboardType: TextInputType.number, //IOS:- decimal:true
                onSubmitted: (_) => _submitBtn,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitBtn,
              ),
              Container(
                height: 80,
                child: Row(children: [
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Chosen Date'
                          : 'Picked Date${DateFormat.yMd().format(_selectedDate)}')),
                  AdaptiveFlatButton(_presentDatePicker, 'Choose Date!')
                ]),
              ),
              ElevatedButton(
                onPressed: _submitBtn,
                child: Text(
                  "Add transaction",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
