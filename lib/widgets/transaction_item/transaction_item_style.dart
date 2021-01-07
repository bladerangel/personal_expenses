import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

CircleAvatar amountCircleAvatar({
  String data,
  Color backgroundColor,
}) =>
    CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
          child: Text(
            data,
          ),
        ),
      ),
    );

Text titleText(
  String data, {
  BuildContext context,
}) =>
    Text(
      data,
      style: Theme.of(context).textTheme.headline6,
    );

Text dateText(DateTime date) => Text(
      DateFormat.yMMMd().format(
        date,
      ),
    );

Widget deleteIconButton({
  String label,
  Function onPressed,
  BuildContext context,
}) =>
    MediaQuery.of(context).size.width > 460
        ? FlatButton.icon(
            textColor: Theme.of(context).errorColor,
            icon: Icon(Icons.delete),
            label: Text(label),
            onPressed: onPressed,
          )
        : IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: onPressed,
          );
