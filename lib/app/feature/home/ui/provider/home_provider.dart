import 'package:contacts_app_isidore/app/feature/home/data/repository/contacts_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(ContactsRepository contactsRepository)
      : _contactsRepository = contactsRepository;

  final ContactsRepository _contactsRepository;
  LoadingState _loadingState = LoadingState.idle;

  LoadingState get loadingState => _loadingState;

  String _errorMsg = 'An unknown error occured';

  String get errorMsg => _errorMsg;

  void _updateLoadingState(LoadingState loadingState) {
    _loadingState = loadingState;
    notifyListeners();
  }

  void _updateErrorMessage(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners();
  }

  Future<void> addContact() async {
    _updateLoadingState(LoadingState.busy);
    final response = await _contactsRepository.addContact();
    response.fold(
      (error) {
        _updateLoadingState(LoadingState.error);
        _updateErrorMessage(error.message!);
      },
      (response) {
        _updateLoadingState(LoadingState.done);
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
        _updateLoadingState(LoadingState.done);
      },
    );
  }
}
