import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';
import 'package:contacts_app_isidore/app/feature/home/data/repository/contacts_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required ContactsRepository contactsRepository})
      : _contactsRepository = contactsRepository;

  final ContactsRepository _contactsRepository;
  LoadingState _loadingState = LoadingState.idle;

  LoadingState get loadingState => _loadingState;

  String _errorMsg = 'An unknown error occured';

  String get errorMsg => _errorMsg;

  List<Contact> _contactsResponse = List.empty(growable: true);

  List<Contact> get contactResponse => _contactsResponse;

  void _updateLoadingState(LoadingState loadingState) {
    _loadingState = loadingState;
    notifyListeners();
  }

  void _updateErrorMessage(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners();
  }

  void _updateContactsResponse(List<Contact> response) {
    _contactsResponse = response;
    notifyListeners();
  }

  Future<void> addContact({
    required String name,
    required String phone,
    required String email,
    required String address,
  }) async {
    _updateLoadingState(LoadingState.busy);
    final response = await _contactsRepository.addContact(
      name: name,
      phone: phone,
      email: email,
      address: address,
    );
    response.fold(
      (error) {
        _updateLoadingState(LoadingState.error);
        _updateErrorMessage(error.message!);
      },
      (response) {
        getAllContacts();
        _updateLoadingState(LoadingState.done);
        // refresh contact list
      },
    );
  }

  Future<void> getAllContacts() async {
    _updateLoadingState(LoadingState.busy);
    final response = await _contactsRepository.getAllContacts();
    response.fold(
      (error) {
        _updateLoadingState(LoadingState.error);
        _updateErrorMessage(error.message!);
      },
      (response) {
        // print(response.contacts.last.name);
        _updateContactsResponse(response.contacts);
        _updateLoadingState(LoadingState.done);
      },
    );
  }
}
