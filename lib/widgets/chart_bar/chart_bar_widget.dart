import 'package:flutter/material.dart';

import './chart_bar_style.dart' as Style;

class ChartBarWidget extends StatelessWidget {
  final String label;
  final double amount;
  final double percentTotalAmount;

  const ChartBarWidget({
    Key key,
    this.label,
    this.amount,
    this.percentTotalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${amount.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 200, 200, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Style.percentTotalAmountFractionallySizedBox(
                heightFactor: percentTotalAmount,
                context: context,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
