import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';

abstract class ContactsDataSource {
  Future<void> addContact({
    required String name,
    required String phone,
    required String email,
    required String address,
    bool discarded = false,
  });
  Future<ContactsResponse> getAllContacts();
}
