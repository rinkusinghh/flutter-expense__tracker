import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function AddTxn;
  NewTransaction(this.AddTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitBtn() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.AddTxn(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.number, //IOS:- decimal:true
              onSubmitted: (_) => submitBtn,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitBtn,
            ),
            Container(
              height: 80,
              child: Row(children: [
                Text('No Chosen Date'),
                TextButton(
                  onPressed: () {},
                  child: Text('Chosen Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ]),
            ),
            ElevatedButton(
              onPressed: submitBtn,
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
    );
  }
}
