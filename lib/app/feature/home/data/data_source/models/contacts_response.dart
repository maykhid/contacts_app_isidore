class ContactsResponse {
  ContactsResponse({
    required this.contacts,
  });

  factory ContactsResponse.fromMap(Map<String, dynamic> json) {
    final contactsList = <Contact>[];

    for (final i in json['contacts'] as List) {
      contactsList.add(Contact.fromJson(i as Map<String, dynamic>));
    }

 
    return ContactsResponse(
      contacts: contactsList,
    );
  }
  final List<Contact> contacts;
}

class Contact {
  Contact({
    required this.address,
    required this.createdAt,
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
    required this.updatedAt,
  });
  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        address: json['address'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        email: json['email'] as String,
        id: json['id'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
  final String address;
  final DateTime createdAt;
  final String email;
  final String id;
  final String name;
  final String phone;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'address': address,
        'createdAt': createdAt.toIso8601String(),
        'email': email,
        'id': id,
        'name': name,
        'phone': phone,
        'updatedAt': updatedAt.toIso8601String(),
      };
}
