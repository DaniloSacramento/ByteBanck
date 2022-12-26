import 'dart:ui';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/pages/contact_form.dart';
import 'package:bytebank/pages/contacts_list.dart';
import 'package:bytebank/pages/desboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
  save(Contact(1, 'Danilo', 1000)).then((id) {
    findAll().then((contacts) => print(contacts.toString()));
  });
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
