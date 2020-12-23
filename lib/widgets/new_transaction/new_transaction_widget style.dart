import 'package:flutter/material.dart';

FlatButton addNewTransaction({Function onPressed}) => FlatButton(
      textColor: Colors.purple,
      onPressed: onPressed,
      child: Text('Add Transaction'),
    );
