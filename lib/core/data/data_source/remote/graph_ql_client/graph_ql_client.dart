import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:graphql/client.dart';

class GraphQLClientImpl implements IClient {
  GraphQLClientImpl({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  final GraphQLClient _graphQLClient;
  
  @override
  Future<QueryResult<Object?>> performMutation({
    required MutationOptions<Object?> options,
  }) =>
      _graphQLClient.mutate(options);

  @override
  Future<QueryResult<Object?>> performQuery({
    required QueryOptions<Object?> options,
  }) =>
      _graphQLClient.query(options);
}
