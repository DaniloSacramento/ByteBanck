import 'dart:convert';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url:  ${data.toHttpRequest().toString()}');
    print('headers: ${data.headers.toString()}');
    print('body: ${data.body.toString()}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers.toString()}');
    print('body: ${data.body.toString()}');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Response response = await client.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 4));
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

final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'http://192.168.0.54:8080/transactions';

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionsMap = {
    'value': transaction.value,
    'contact': {'name': transaction.contact.name, 'accountNumber': transaction.contact.accountNumber}
  };
  final String transactionJson = jsonEncode(transactionsMap);
  final Response response = await client.post(Uri.parse(baseUrl),
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson);
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
