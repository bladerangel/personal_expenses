import 'package:flutter/material.dart';

Container amountContainer({Widget child}) => Container(
      child: child,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
    );

Text amountText(String data) => Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.purple,
      ),
    );

Text titleText(String data) => Text(
      data,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

Text dateText(String data) => Text(
      data,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
