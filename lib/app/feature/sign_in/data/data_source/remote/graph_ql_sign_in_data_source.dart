import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/gql_response_handler.dart';
import 'package:graphql/client.dart';

class GraphQLSignInDataSource implements SignInDataSource {
  GraphQLSignInDataSource({required IClient client}) : _client = client;

  final IClient _client;

  @override
  Future<SignInResponse> signIn() async {
    // options
    final options = MutationOptions(
      document: gql(''),
    );

    try {
      final response = await _client.performMutation(options: options);
      final responseOrError = GQLResponseHandler().handleResponse(response);
      return SignInResponse();
    } catch (e) {
      rethrow;
    }
  }
}
