// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key? key,
    this.message = 'Loading',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const CircularProgressIndicator(), Text(message)],
      ),
    );
  }
}
