import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('New Contact'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Full name'),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Account number'),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(width: double.maxFinite, child: ElevatedButton(onPressed: () {}, child: const Text('Create'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
