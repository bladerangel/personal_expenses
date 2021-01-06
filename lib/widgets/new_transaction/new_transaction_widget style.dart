import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextField titleTextField({
  String labelText,
  TextEditingController controller,
  Function onSubmitted,
}) =>
    TextField(
      decoration: InputDecoration(labelText: labelText),
      controller: controller,
      onSubmitted: (_) => onSubmitted(),
    );

TextField amountTextField({
  String labelText,
  TextEditingController controller,
  Function onSubmitted,
}) =>
    TextField(
      decoration: InputDecoration(labelText: labelText),
      controller: controller,
      keyboardType: TextInputType.number,
      onSubmitted: (_) => onSubmitted(),
    );

Expanded selectedDateExpanded(DateTime date) => Expanded(
      child: Text(
        date == null ? 'No Date Chosen.' : DateFormat.yMd().format(date),
      ),
    );

FlatButton chooseDateFlatButton(
  String data, {
  Function onPressed,
  BuildContext context,
}) =>
    FlatButton(
      textColor: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(
        data,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

RaisedButton addNewTransactionRaisedButton(
  String data, {
  Function onPressed,
  BuildContext context,
}) =>
    RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).textTheme.button.color,
      onPressed: onPressed,
      child: Text(data),
    );
