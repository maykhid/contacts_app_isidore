import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/model/sign_up_response.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/gql_response_handler.dart';
import 'package:graphql/client.dart';

class GraphQLSignUpDataSource implements SignUpDataSource {
  GraphQLSignUpDataSource({required IClient client}) : _client = client;

  final IClient _client;

  @override
  Future<SignUpResponse> signUp() async {
    // options
    final options = MutationOptions(
      document: gql(''),
    );

    try {
      final response = await _client.performMutation(options: options);
      final responseOrError = GQLResponseHandler().handleResponse(response);
      return SignUpResponse();
    } catch (e) {
      rethrow;
    }
  }
}
