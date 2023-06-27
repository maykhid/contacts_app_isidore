import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contact.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/models/contacts_response.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/remote/contacts_data_source.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:graphql/client.dart';

class GraphQLContactsDataSource implements ContactsDataSource {
  GraphQLContactsDataSource({required IClient client}) : _client = client;

  final IClient _client;

  @override
  Future<Contact> addContact() async {
    // options
    final options = MutationOptions(
      document: gql(''),
    );

    try {
      final response = await _client.performMutation(options: options);
      // final responseOrError = GQLResponseHandler().handleResponse(response);
      return Contact();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ContactsResponse> getAllContacts() async {
    // options
    final options = QueryOptions(
      document: gql(''),
    );

    try {
      final response = await _client.performQuery(options: options);
      // final responseOrError = GQLResponseHandler().handleResponse(response);
      return ContactsResponse();
    } catch (e) {
      rethrow;
    }
  }
}
