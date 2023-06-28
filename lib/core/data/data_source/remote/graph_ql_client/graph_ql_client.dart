import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/keys.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLClientImpl implements IClient {
  GraphQLClientImpl();

  GraphQLClient createClient() {
    final prefs = sl<SharedPreferences>();
    final httpLink = HttpLink(
      'https://demo.isidoreagric.co',
      defaultHeaders: {
        'Authorization':
            'Bearer ${prefs.getString(AppStorageKeys.tokenKey) ?? ''}'
      },
    );

    final Link link = httpLink;

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  @override
  Future<QueryResult<Object?>> performMutation({
    required MutationOptions<Object?> options,
  }) =>
      createClient().mutate(options);

  @override
  Future<QueryResult<Object?>> performQuery({
    required QueryOptions<Object?> options,
  }) =>
      createClient().query(options);
}
