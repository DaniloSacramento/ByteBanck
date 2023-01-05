// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contact {
  final int? id;
  final String? name;
  final int? accountNumber;

  static var fromjson;
  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() => 'Contact(name: $name, accountNumber: $accountNumber)';

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'accountNumber': accountNumber,
      };
}
