import 'package:flutter/material.dart';

import './../transaction_item/transaction_item_widget.dart';
import '../../models/transaction.dart';
import './transaction_list_style.dart' as Style;

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionListWidget({
    Key key,
    this.transactions,
    this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Style.emptyTransactionLayoutBuilder(
            data: 'No transactions',
            image: 'assets/images/waiting.png',
          )
        : ListView(
            children: transactions
                .map((transaction) => TransactionItemWidget(
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteTransaction: deleteTransaction))
                .toList(),
          );
  }
}
