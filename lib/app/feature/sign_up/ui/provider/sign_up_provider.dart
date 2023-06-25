import 'package:contacts_app_isidore/app/feature/sign_up/data/repository/sign_up_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider with ChangeNotifier {
  SignUpProvider(SignUpRepository signUpRepository)
      : _signUpRepository = signUpRepository;

  final SignUpRepository _signUpRepository;

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
    final response = await _signUpRepository.signUp();
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
