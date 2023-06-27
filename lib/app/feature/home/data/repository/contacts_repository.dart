import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/remote/contacts_data_source.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:contacts_app_isidore/core/model/error/failure.dart';
import 'package:dartz/dartz.dart';

class ContactsRepository {
  ContactsRepository({required ContactsDataSource contactsDataSource})
      : _contactsDataSource = contactsDataSource;

  final ContactsDataSource _contactsDataSource;

  Future<Either<Failure, bool>> addContact() async {
    try {
      await _contactsDataSource.addContact();
      return const Right(true);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(message: e.toString(), code: '0'),
      );
    }
  }

  Future<Either<Failure, ContactsResponse>> getAllContacts() async {
    try {
      final response = await _contactsDataSource.getAllContacts();
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
