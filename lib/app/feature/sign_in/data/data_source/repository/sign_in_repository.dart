import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/keys.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:contacts_app_isidore/core/model/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInRepository {
  SignInRepository({
    required SignInDataSource signInDataSource,
    required FlutterSecureStorage secureStorage,
  })  : _signInDataSource = signInDataSource,
        _flutterSecureStorage = secureStorage;

  final SignInDataSource _signInDataSource;
  final FlutterSecureStorage _flutterSecureStorage;

  Future<Either<Failure, SignInResponse>> signIn(
    String email,
    String password,
  ) async {
    try {
      final response = await _signInDataSource.signIn(email, password);
      // store token
      await _flutterSecureStorage.write(
        key: AppStorageKeys.tokenKey,
        value: response.login.user!.tokens,
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
}
