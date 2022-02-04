import '../Models/transaction.dart';
import 'package:flutter/material.dart';
import './user_transactions.dart';
import 'transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // child: ListView(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Transactions Added Yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView(
              children: transactions
                  .map((tx) => Transaction_item(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList()),

      // ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return Transaction_item(transaction: transactions[index], deleteTx: deleteTx);
      //     },
      //   itemCount: transactions.length,
      //   // children: transactions.map((tx) {
      // )
      // return Card(
      //   child: Row(
      //     children: <Widget>[
      //       Container(
      //         margin: EdgeInsets.symmetric(
      //           vertical: 10,
      //           horizontal: 15,
      //         ),
      //         decoration: BoxDecoration(
      //           border: Border.all(
      //             color: Theme.of(context).primaryColor,
      //             width: 2,
      //           ),
      //         ),
      //         padding: EdgeInsets.all(10),
      //         child: Text(
      //           "Rs. ${transactions[index].amount.toStringAsFixed(2)}",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //         ),
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text(
      //             transactions[index].title,
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Text(
      //             DateFormat.yMMMd()
      //                 .format(transactions[index].date),
      //             style: TextStyle(
      //               color: Colors.grey,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // );

      // }).toList(),
    );
  }
}
