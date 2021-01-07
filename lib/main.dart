import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import './models/transaction.dart';
import './widgets/new_transaction/new_transaction_widget.dart';
import './main_style.dart' as Style;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Style.materialApp(
      title: 'Personal Expenses',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  bool _showChart = false;

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

    setState(() => _transactions.add(transaction));
  }

  void _deleteTransaction(String id) {
    setState(
        () => _transactions.removeWhere((transaction) => transaction.id == id));
  }

  @override
  Widget build(BuildContext context) {
    final bool _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final PreferredSizeWidget _appBar = Style.appBar(
      title: "Personal Expenses",
      onPressed: () => _modalNewTransaction(context),
    );

    double calculateHeight() =>
        (MediaQuery.of(context).size.height - _appBar.preferredSize.height);

    final SafeArea _body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isLandscape)
              Style.showChartRow(
                title: 'Show Chart',
                initialValue: _showChart,
                onChanged: (value) => setState(() => _showChart = value),
                context: context,
              ),
            if (!_isLandscape)
              Style.chartWidgetContainer(
                height: calculateHeight() * 0.3,
                transactions: _recentTransactions,
              ),
            if (!_isLandscape)
              Style.transactionListWidgetContainer(
                height: calculateHeight() * 0.7,
                transactions: _transactions,
                deleteTransaction: _deleteTransaction,
              ),
            if (_isLandscape)
              _showChart
                  ? Style.chartWidgetContainer(
                      height: calculateHeight() * 0.7,
                      transactions: _recentTransactions,
                    )
                  : Style.transactionListWidgetContainer(
                      height: calculateHeight() * 0.7,
                      transactions: _transactions,
                      deleteTransaction: _deleteTransaction,
                    ),
          ],
        ),
      ),
    );

    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageScaffold(
            child: _body,
            navigationBar: _appBar,
          )
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Style.modalNewTransactionFloatingActionButton(
              onPressed: () => _modalNewTransaction(context),
            ),
            appBar: _appBar,
            body: _body,
          );
  }
}
