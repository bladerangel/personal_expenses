import 'package:flutter/material.dart';

import './widgets/chart/chart_widget.dart';
import './widgets/transaction_list/transaction_list_widget.dart';
import './models/transaction.dart';
import './widgets/new_transaction/new_transaction_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions => _transactions
      .where(
        (transaction) => transaction.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        ),
      )
      .toList();

  _modalNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewTransactionWiget(
        onPressed: _addNewTransaction,
      ),
    );
  }

  void _addNewTransaction(
    String title,
    double amount,
    DateTime date,
  ) {
    final transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amout: amount,
      date: date,
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _modalNewTransaction(context),
      ),
      appBar: AppBar(
        title: Text(
          "Personal Expenses",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _modalNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ChartWidget(
              transactions: _recentTransactions,
            ),
            TransactionListWidget(
              transactions: _transactions,
            ),
          ],
        ),
      ),
    );
  }
}
