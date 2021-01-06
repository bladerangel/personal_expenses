import 'package:flutter/material.dart';

import './new_transaction_widget style.dart' as Style;

class NewTransactionWiget extends StatefulWidget {
  final Function onPressed;

  NewTransactionWiget({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  _NewTransactionWigetState createState() => _NewTransactionWigetState();
}

class _NewTransactionWigetState extends State<NewTransactionWiget> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submit() {
    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onPressed(
      title,
      amount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Style.titleTextField(
              labelText: 'Title',
              controller: titleInputController,
              onSubmitted: submit,
            ),
            Style.amountTextField(
              labelText: 'Amout',
              controller: amountInputController,
              onSubmitted: submit,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Style.addNewTransactionFlatButton(
                  onPressed: submit,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
