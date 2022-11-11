import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function AddTxn;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.AddTxn);

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
              // onChanged: (value) {
              //   titleInput = value;
              // },

              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },

              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                // print(titleInput, amountInput)
                // print(titleController.text);
                AddTxn(
                    titleController.text, double.parse(amountController.text));
              },
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
