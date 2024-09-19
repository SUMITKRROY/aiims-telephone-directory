// models/contact.dart
class Contact {
  final int id;
  final String fullName;
  final String design;
  final String dpt;
  final String intOfficial1;
  final String mobOfficial1;
  final String offAddress;

  Contact({
    required this.id,
    required this.fullName,
    required this.design,
    required this.dpt,
    required this.intOfficial1,
    required this.mobOfficial1,
    required this.offAddress,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      fullName: json['fullName'],
      design: json['design'],
      dpt: json['dpt'],
      intOfficial1: json['intOfficial1'],
      mobOfficial1: json['mobOfficial1'],
      offAddress: json['offAddress'],
    );
  }
}
