import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 4));
    List<Transaction> transactions = _toTransaction(response);
    return transactions;
  }

  List<Transaction> _toTransaction(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
          transactionJson['value'],
          Contact(
            0,
            contactJson['name'],
            contactJson['accountNumber'],
          ));
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionsMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionsMap);
    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);
    return _toTransactions(response);
  }

  Transaction _toTransactions(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> contactJson = json['contact'];
    return Transaction(
        json['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionsMap = {
      'value': transaction.value,
      'contact': {'name': transaction.contact.name, 'accountNumber': transaction.contact.accountNumber}
    };
    return transactionsMap;
  }
}
