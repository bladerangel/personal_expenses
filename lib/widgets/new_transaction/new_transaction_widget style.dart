import 'package:flutter/material.dart';

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

FlatButton addNewTransactionFlatButton({
  Function onPressed,
}) =>
    FlatButton(
      textColor: Colors.purple,
      onPressed: onPressed,
      child: Text('Add Transaction'),
    );
