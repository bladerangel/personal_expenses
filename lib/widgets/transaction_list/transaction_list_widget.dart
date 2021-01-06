import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import './transaction_list_style.dart' as Style;

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListWidget({
    Key key,
    this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Style.emptyTransactionColumn(
              data: 'No transactions',
              image: 'assets/images/waiting.png',
              context: context,
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: Style.amountCircleAvatar(
                    '\$${transactions[index].amout}',
                  ),
                  title: Style.titleText(
                    transactions[index].title,
                    context: context,
                  ),
                  subtitle: Style.dateText(
                    transactions[index].date,
                  ),
                ),
              ),
            ),
    );
  }
}
