// ignore_for_file: avoid_dynamic_calls

import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/remote/contacts_data_source.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/documents.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:graphql/client.dart' hide ServerException;

class GraphQLContactsDataSource implements ContactsDataSource {
  GraphQLContactsDataSource({required IClient client}) : _client = client;

  final IClient _client;

  @override
  Future<void> addContact({
    required String name,
    required String phone,
    required String email,
    required String address,
    bool discarded = false,
  }) async {
    // options
    final options = MutationOptions(
      document: gql(GQLDocuments.addContact),
      variables: {
        'contactInput': {
          'name': name,
          'phone': phone,
          'email': email,
          'address': address,
          'discarded': discarded
        }
      },
    );

    try {
      final response = await _client.performMutation(options: options);
      if (response.data != null) {
        print(response.data);
        final statusCode = response.data!['contact']['status'] as int;

        if (statusCode >= 200 && statusCode <= 299) {
          return;
        } else if (statusCode >= 400 && statusCode <= 499) {
          final errors = response.data!['contact']['errors'] as List;

          throw ClientException(
            errors[0]['fullMessage'].toString(),
            statusCode,
          );
        } else if (response.exception is GraphQLError) {
          throw ServerException(
            response.exception!.graphqlErrors[0].message,
            statusCode,
          );
        }
      }
      throw Exception(
        response.exception!.linkException!.originalException.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ContactsResponse> getAllContacts() async {
    // options
    final options = QueryOptions(
      document: gql(GQLDocuments.allContacts),
    );

    try {
      final response = await _client.performQuery(options: options);
      if (response.data != null) {
        return ContactsResponse.fromMap(response.data!);
      } else if (response.exception is GraphQLError) {
        throw ClientException(
          response.exception!.graphqlErrors[0].message,
          400,
        );
      } else if (response.exception is GraphQLError) {
        throw ServerException(
          response.exception!.graphqlErrors[0].message,
          500,
        );
      }
      throw Exception(
        'Unexepected Error',
      );
    } catch (e) {
      rethrow;
    }
  }
}
