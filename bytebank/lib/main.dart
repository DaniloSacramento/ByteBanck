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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Deshboard'),
        ),
        body: Column(
          children: [
            Image.asset('images/bytebank_logo.png'),
            Container(
              height: 120,
              width: 100,
              color: Colors.green[800],
              child: Column(
                children: [Icon(Icons.people), Text('Contacts')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
