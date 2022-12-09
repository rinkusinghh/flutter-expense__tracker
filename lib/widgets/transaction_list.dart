import "package:flutter/material.dart";
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No, transaction adding yet!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('₹ ${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transaction[index].id),
                            label: Text('Delete'),
                            icon: Icon(Icons.delete),
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).errorColor,
                              foregroundColor: Colors.white,
                            ))
                        : IconButton(
                            onPressed: () => deleteTx(transaction[index].id),
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
