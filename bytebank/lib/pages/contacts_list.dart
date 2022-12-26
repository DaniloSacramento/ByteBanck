// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/pages/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  ContactsList({super.key});

  final List<Contact> contacts = [];

  Key? key;

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(0, 'danilo', 1000));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return _ContactItem(key, contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactForm())).then(
                (newContact) => debugPrint(newContact.toString()),
              );
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
    this.contact,
  ) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
