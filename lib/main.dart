import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsBindingObserver.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense tracker',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          // appBarTheme: AppBarTheme(textTheme: ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'Weekly Grocery!',
    //   amount: 500,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New Items!',
    //   amount: 800,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't3',
    //   title: 'Food Items',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),
  ];

  @override
  void init() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeLifecycleState(AppLifecycleState state) {
    // print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addUserTransaction(
    String txTitle,
    double txAmount,
    /* DateTime chosenDate */
  ) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addUserTransaction));
        });
  }

  void _deleteTransaction(String id) {
    setState(() => _userTransaction.removeWhere((tx) => tx.id == id));
  }

  // Builder Method
  List<Widget> _buildLanscapeWidget(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch.adaptive(
              value: _showChart,
              onChanged: (val) {
                setState(() => _showChart = val);
              })
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      mediaQuery.padding.top -
                      appBar.preferredSize.height) *
                  0.6,
              child: Chart(_recentTransactions))
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitWidget(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  mediaQuery.padding.top -
                  appBar.preferredSize.height) *
              0.3,
          child: Chart(_recentTransactions)),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // enum:- Is a couple of different values!
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              ..._buildLanscapeWidget(mediaQuery, appBar, txListWidget),

            if (!isLandscape)
              ..._buildPortraitWidget(mediaQuery, appBar, txListWidget),
            // if (!isLandscape) txListWidget,

            // Chart text!
            // if (isLandscape)
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: pageBody,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

// fromARGB(255, 211, 176, 19)
