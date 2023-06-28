import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/keys.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:contacts_app_isidore/core/model/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInRepository {
  SignInRepository({
    required SignInDataSource signInDataSource,
    required SharedPreferences sharedPreferences,
  })  : _signInDataSource = signInDataSource,
        _sharedPreferences = sharedPreferences;

  final SignInDataSource _signInDataSource;
  final SharedPreferences _sharedPreferences;

  Future<Either<Failure, SignInResponse>> signIn(
    String email,
    String password,
  ) async {
    try {
      final response = await _signInDataSource.signIn(email, password);
      // store token
      await _sharedPreferences.setString(
        AppStorageKeys.tokenKey,
        response.login.user!.tokens,
      );
         
      return Right(response);
    } on ClientException catch (e) {
      return Left(ClientFailure(message: e.message, code: e.code.toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code.toString()));
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: e.toString(), code: '0'),
      );
    }
  }

  bool isUserLoggedIn() =>
      _sharedPreferences.containsKey(AppStorageKeys.tokenKey) &&
      !JwtDecoder.isExpired(
        _sharedPreferences.getString(AppStorageKeys.tokenKey)!,
      );
}
