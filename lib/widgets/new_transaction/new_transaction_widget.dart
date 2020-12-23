import 'package:flutter/material.dart';

import './new_transaction_widget style.dart' as Style;

class NewTransactionWiget extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final Function onPressed;

  NewTransactionWiget({Key key, this.onPressed}) : super(key: key);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amountInputController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Style.addNewTransaction(
                  onPressed: () => onPressed(
                    titleInputController.text,
                    double.parse(amountInputController.text),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
