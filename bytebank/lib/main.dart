import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/pages/desboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
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
            elevatedButtonTheme: ElevatedButtonThemeData(style: TextButton.styleFrom(backgroundColor: Colors.green[800]))),
        home: const Deshboard());
  }
}
