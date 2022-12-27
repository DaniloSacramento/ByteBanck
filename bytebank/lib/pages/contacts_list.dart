// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/pages/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  Key? key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [CircularProgressIndicator(), Text('Loading')],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return _ContactItem(key, contact);
                },
                itemCount: contacts?.length,
              );
              break;
          }
          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => const ContactForm(),
              ))
              .then((reload) => setState(() {}));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[800],
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  const _ContactItem(
    Key? key,
    this.contact,
  ) : super(key: key);
  final Contact contact;

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.contact.name.toString(),
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          widget.contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
