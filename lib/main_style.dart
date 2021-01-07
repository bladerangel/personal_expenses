import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './widgets/transaction_list/transaction_list_widget.dart';
import './models/transaction.dart';
import './widgets/chart/chart_widget.dart';

MaterialApp materialApp({
  String title,
  Widget home,
}) =>
    MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: home,
    );

PreferredSizeWidget appBar({
  String title,
  Function onPressed,
}) =>
    defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoNavigationBar(
            middle: Text(
              title,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: onPressed,
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              title,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onPressed,
              ),
            ],
          );

FloatingActionButton modalNewTransactionFloatingActionButton({
  Function onPressed,
}) =>
    defaultTargetPlatform == TargetPlatform.iOS
        ? Container()
        : FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: onPressed,
          );

Row showChartRow({
  String title,
  bool initialValue,
  Function onChanged,
  BuildContext context,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        Switch.adaptive(
          activeColor: Theme.of(context).accentColor,
          value: initialValue,
          onChanged: onChanged,
        )
      ],
    );

Container chartWidgetContainer({
  double height,
  List<Transaction> transactions,
}) =>
    Container(
      height: height,
      child: ChartWidget(
        transactions: transactions,
      ),
    );

Container transactionListWidgetContainer({
  double height,
  List<Transaction> transactions,
  Function deleteTransaction,
}) =>
    Container(
      height: height,
      child: TransactionListWidget(
        transactions: transactions,
        deleteTransaction: deleteTransaction,
      ),
    );
