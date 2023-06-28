import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/model/sign_up_response.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:contacts_app_isidore/core/model/error/failure.dart';
import 'package:dartz/dartz.dart';

class SignUpRepository {
  SignUpRepository({required SignUpDataSource signUpDataSource})
      : _signUpDataSource = signUpDataSource;

  final SignUpDataSource _signUpDataSource;

  Future<Either<Failure, SignUpResponse>> signUp(
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response =
          await _signUpDataSource.signUp(email, password, passwordConfirmation);
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
