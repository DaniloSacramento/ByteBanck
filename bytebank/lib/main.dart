import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/pages/desboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
  save(Transaction(200.0, Contact(0, 'Julia', 2000))).then((transaction) => print(transaction));
  findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green[900],
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
        ),
        home: const Deshboard());
  }
}
