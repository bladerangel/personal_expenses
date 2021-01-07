import 'package:flutter/material.dart';

LayoutBuilder emptyTransactionLayoutBuilder({
  String data,
  String image,
}) =>
    LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
