import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';
import 'package:contacts_app_isidore/core/model/error/failure.dart';
import 'package:dartz/dartz.dart';

class SignInRepository {
  SignInRepository({required SignInDataSource signInDataSource})
      : _signInDataSource = signInDataSource;

  final SignInDataSource _signInDataSource;

  Future<Either<Failure, SignInResponse>> signIn() async {
    try {
      final response = await _signInDataSource.signIn();
      return Right(response);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: e.toString(), code: '0'),
      );
    }
  }
}
