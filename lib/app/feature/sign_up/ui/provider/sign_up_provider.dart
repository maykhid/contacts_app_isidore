import 'package:contacts_app_isidore/app/feature/sign_up/data/repository/sign_up_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider with ChangeNotifier {
  SignUpProvider({required SignUpRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  final SignUpRepository _signUpRepository;

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

  Future<void> signUp(
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    _updateLoadingState(LoadingState.busy);
    final response =
        await _signUpRepository.signUp(email, password, passwordConfirmation);
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
