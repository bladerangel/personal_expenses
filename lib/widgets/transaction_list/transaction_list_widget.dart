import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';
import './transaction_list_style.dart' as Style;

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListWidget({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Style.amountContainer(
                context: context,
                child: Style.amountText(
                  '\$${transactions[index].amout.toStringAsFixed(2)}',
                  context: context,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Style.titleText(
                    transactions[index].title,
                  ),
                  Style.dateText(
                    DateFormat.yMMMMd().format(transactions[index].date),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
