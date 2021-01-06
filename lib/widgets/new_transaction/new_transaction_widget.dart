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
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate;

  void _submit() {
    if (_amountInputController.text.isEmpty) {
      return;
    }
    final title = _titleInputController.text;
    final amount = double.parse(_amountInputController.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.onPressed(
      title,
      amount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );

    if (date == null) {
      return;
    }

    setState(() {
      _selectedDate = date;
    });
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
              controller: _titleInputController,
              onSubmitted: _submit,
            ),
            Style.amountTextField(
              labelText: 'Amout',
              controller: _amountInputController,
              onSubmitted: _submit,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Style.selectedDateExpanded(
                    _selectedDate,
                  ),
                  Style.chooseDateFlatButton(
                    'Choose Date.',
                    onPressed: _presentDatePicker,
                    context: context,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Style.addNewTransactionRaisedButton(
                  'Add Transaction',
                  onPressed: _submit,
                  context: context,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
