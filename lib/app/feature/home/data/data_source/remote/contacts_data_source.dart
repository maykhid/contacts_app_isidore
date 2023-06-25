import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contact.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';

abstract class ContactsDataSource {
  Future<Contact> addContact();
  Future<ContactsResponse> getAllContacts();
}
