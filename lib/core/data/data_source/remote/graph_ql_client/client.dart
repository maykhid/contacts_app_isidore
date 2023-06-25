import 'package:graphql/client.dart';

abstract class IClient {
  Future<QueryResult> performMutation({
    required MutationOptions<Object?> options,
  });

  Future<QueryResult> performQuery({
    required QueryOptions<Object?> options,
  });
}
