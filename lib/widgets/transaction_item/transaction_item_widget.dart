import 'package:flutter/material.dart';

import './../../models/transaction.dart';
import './transaction_item_style.dart' as Style;

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: Style.amountCircleAvatar(
          '\$${transaction.amout}',
        ),
        title: Style.titleText(
          transaction.title,
          context: context,
        ),
        subtitle: Style.dateText(
          transaction.date,
        ),
        trailing: Style.deleteIconButton(
          label: 'Delete',
          onPressed: () => deleteTransaction(transaction.id),
          context: context,
        ),
      ),
    );
  }
}
