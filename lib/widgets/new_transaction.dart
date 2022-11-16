import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function AddTxn;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.AddTxn);

  void submitBtn() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    AddTxn(enteredTitle, enteredAmount);
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
            TextButton(
              onPressed: submitBtn,
              child: Text(
                "Add transaction",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                  foregroundColor: Color.fromARGB(255, 211, 176, 19)),
            ),
          ],
        ),
      ),
    );
  }
}
