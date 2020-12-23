import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';
import './transaction_list_style.dart' as Style;

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListWidget({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map(
            (transaction) => Card(
              child: Row(
                children: [
                  Style.amountContainer(
                    child: Style.amountText(
                      '\$${transaction.amout}',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Style.titleText(
                        transaction.title,
                      ),
                      Style.dateText(
                        DateFormat.yMMMMd().format(transaction.date),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
