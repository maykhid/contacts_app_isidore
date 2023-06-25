import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:flutter/foundation.dart';

class SignInProvider extends ChangeNotifier {
  SignInProvider(SignInRepository signInRepository)
      : _signInRepository = signInRepository;

  final SignInRepository _signInRepository;

   LoadingState _loadingState = LoadingState.idle;

  LoadingState get loadingState => _loadingState;

  String _errorMsg = 'An unknown error occured';

  String get errorMsg => _errorMsg;

  void updateLoadingState(LoadingState loadingState) {
    _loadingState = loadingState;
    notifyListeners();
  }

  void updateErrorMessage(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners();
  }

  Future<void> signUp() async {
    updateLoadingState(LoadingState.busy);
    final response = await _signInRepository.signIn();
    response.fold(
      (error) {
        updateLoadingState(LoadingState.error);
        updateErrorMessage(error.message!);
      },
      (response) {
        updateLoadingState(LoadingState.done);
      },
    );
  }
}
