import 'package:flutter/material.dart';

Container amountContainer({
  double height,
  String amount,
}) =>
    Container(
      height: height,
      child: FittedBox(
        child: Text(
          amount,
        ),
      ),
    );

Container labelContainer({
  double height,
  String label,
}) =>
    Container(
      height: height,
      child: FittedBox(
        child: Text(
          label,
        ),
      ),
    );

Container percentTotalAmountContainer({
  double height,
  double heightFactor,
  BuildContext context,
}) =>
    Container(
      height: height,
      width: 10,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
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
          FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
