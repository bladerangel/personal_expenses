import 'package:flutter/material.dart';

import './../chart_bar/chart_bar_widget.dart';

Flexible transactionGroupFlexible({
  String label,
  double amount,
  double percentTotalAmount,
  double totalAmount,
}) =>
    Flexible(
      fit: FlexFit.tight,
      child: ChartBarWidget(
        label: label,
        amount: amount,
        percentTotalAmount: totalAmount == 0.0 ? 0.0 : amount / totalAmount,
      ),
    );
