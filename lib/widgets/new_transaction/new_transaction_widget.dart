import 'package:flutter/material.dart';

import './new_transaction_widget style.dart' as Style;

class NewTransactionWiget extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final Function onPressed;

  NewTransactionWiget({Key key, this.onPressed}) : super(key: key);

  void submit() {
    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    onPressed(
      title,
      amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInputController,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amountInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Style.addNewTransaction(
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
