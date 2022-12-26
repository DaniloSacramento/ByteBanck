import 'package:bytebank/pages/contacts_list.dart';
import 'package:flutter/material.dart';

class Deshboard extends StatelessWidget {
  const Deshboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: const Text('Deshboard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.green[800],
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsList()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 32,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
