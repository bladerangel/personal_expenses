import 'package:flutter/material.dart';

import '../new_transaction/new_transaction_widget.dart';
import '../transaction_list/transaction_list_widget.dart';
import '../../models/transaction.dart';

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  final List<Transaction> _transactions = [
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

  void _addNewTransaction(String title, double amount) {
    final transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amout: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionWiget(onPressed: _addNewTransaction),
        TransactionListWidget(
          transactions: _transactions,
        ),
      ],
    );
  }
}
