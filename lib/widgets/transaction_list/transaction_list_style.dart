import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Column emptyTransactionColumn({
  String data,
  String image,
  BuildContext context,
}) =>
    Column(
      children: [
        Text(
          data,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );

CircleAvatar amountCircleAvatar(
  String data,
) =>
    CircleAvatar(
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
          child: Text(
            data,
          ),
        ),
      ),
    );

Text titleText(
  String data, {
  BuildContext context,
}) =>
    Text(
      data,
      style: Theme.of(context).textTheme.headline6,
    );

Text dateText(DateTime date) => Text(
      DateFormat.yMMMd().format(
        date,
      ),
    );
