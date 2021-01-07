import 'dart:math';
import 'package:flutter/material.dart';

import './../../models/transaction.dart';
import './transaction_item_style.dart' as Style;

class TransactionItemWidget extends StatefulWidget {
  const TransactionItemWidget({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemWidgetState createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  Color _color;

  @override
  void initState() {
    const colors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];
    _color = colors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: Style.amountCircleAvatar(
          backgroundColor: _color,
          data: '\$${widget.transaction.amout}',
        ),
        title: Style.titleText(
          widget.transaction.title,
          context: context,
        ),
        subtitle: Style.dateText(
          widget.transaction.date,
        ),
        trailing: Style.deleteIconButton(
          label: 'Delete',
          onPressed: () => widget.deleteTransaction(widget.transaction.id),
          context: context,
        ),
      ),
    );
  }
}
