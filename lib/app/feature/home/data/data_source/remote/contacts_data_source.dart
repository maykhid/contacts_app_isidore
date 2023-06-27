import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';

abstract class ContactsDataSource {
  Future<void> addContact();
  Future<ContactsResponse> getAllContacts();
}
