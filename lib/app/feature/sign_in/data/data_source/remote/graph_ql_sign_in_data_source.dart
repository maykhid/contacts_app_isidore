// ignore_for_file: avoid_dynamic_calls

import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/documents.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:graphql/client.dart' hide ServerException;

class GraphQLSignInDataSource implements SignInDataSource {
  GraphQLSignInDataSource({required IClient client}) : _client = client;

  final IClient _client;

  @override
  Future<SignInResponse> signIn(String email, String password) async {
    // options
    final options = MutationOptions(
      document: gql(GQLDocuments.login),
      variables:  {
        'email': email,
        'password': password,
      },
    );

    try {
      final response = await _client.performMutation(options: options);
      final statusCode = response.data!['login']['status'] as int;

      if (statusCode >= 200 && statusCode <= 299) {
        return SignInResponse.fromMap(response.data!);
      } else if (statusCode >= 400 && statusCode <= 499) {
        final errors = response.data!['login']['errors'] as List;
        
        throw ClientException(errors[0]['fullMessage'].toString(), statusCode);
      } else if (response.exception is GraphQLError) {
        throw ServerException(
          response.exception!.graphqlErrors[0] as String?,
          statusCode,
        );
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
