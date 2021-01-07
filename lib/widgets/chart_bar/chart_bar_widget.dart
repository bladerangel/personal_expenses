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
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Style.amountContainer(
            height: constraints.maxHeight * 0.15,
            amount: '\$${amount.toStringAsFixed(0)}',
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Style.percentTotalAmountContainer(
            height: constraints.maxHeight * 0.6,
            heightFactor: percentTotalAmount,
            context: context,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Style.labelContainer(
            height: constraints.maxHeight * 0.15,
            label: label,
          ),
        ],
      ),
    );
  }
}
