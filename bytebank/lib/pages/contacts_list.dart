// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/pages/contact_form.dart';
import 'package:bytebank/pages/transaction_form.dart';
import 'package:bytebank/widgets/progress.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  Key? key;
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return _ContactItem(
                    key,
                    contact,
                    onclick: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionForm(contact)));
                    },
                  );
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

class _ContactItem extends StatelessWidget {
  const _ContactItem(
    Key? key,
    this.contact, {
    required this.onclick,
  }) : super(key: key);
  final Contact contact;
  final Function onclick;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onclick(),
        title: Text(
          contact.name.toString(),
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
