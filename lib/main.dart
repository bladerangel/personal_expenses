import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';
import './components.dart' as Components;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amout: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shorts',
      amout: 49.99,
      date: DateTime.now(),
    ),
  ];

  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleInputController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amout'),
                    controller: amountInputController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleInputController.text);
                          print(amountInputController.text);
                        },
                        child: Text('Add Transaction'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            elevation: 5,
          ),
          Column(
            children: transactions
                .map(
                  (transaction) => Card(
                    child: Row(
                      children: [
                        Components.amountContainer(
                          child: Components.amountText(
                            '\$${transaction.amout}',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Components.titleText(
                              transaction.title,
                            ),
                            Components.dateText(
                              DateFormat.yMMMMd().format(transaction.date),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
