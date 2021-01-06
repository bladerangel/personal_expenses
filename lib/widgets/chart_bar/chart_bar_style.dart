import 'package:flutter/material.dart';

FractionallySizedBox percentTotalAmountFractionallySizedBox({
  double heightFactor,
  BuildContext context,
}) =>
    FractionallySizedBox(
      heightFactor: heightFactor,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
