import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../../models/transaction.dart';
import './chart_style.dart' as Style;

class ChartWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const ChartWidget({
    Key key,
    this.transactions,
  }) : super(key: key);

  List<Map<String, Object>> get transactionsGroup {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      var totalSum = 0.0;

      for (Transaction recentTransaction in transactions) {
        if (recentTransaction.date.day == weekDay.day &&
            recentTransaction.date.month == weekDay.month &&
            recentTransaction.date.year == weekDay.year) {
          totalSum += recentTransaction.amout;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalAmount => transactionsGroup.fold(
      0.0, (sum, transactionsGroup) => sum += transactionsGroup['amount']);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionsGroup
              .map(
                (transactionGroup) => Style.transactionGroupFlexible(
                  label: transactionGroup['day'],
                  amount: transactionGroup['amount'],
                  percentTotalAmount: transactionGroup['amount'] as double,
                  totalAmount: totalAmount,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
