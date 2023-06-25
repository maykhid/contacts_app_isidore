import 'package:contacts_app_isidore/core/data/data_source/remote/response_handler.dart';
import 'package:contacts_app_isidore/core/model/error/exception.dart';
import 'package:graphql/client.dart' hide ServerException;

class GQLResponseHandler implements ResponseHandler<QueryResult<Object?>> {
  @override
  QueryResult<Object?> handleResponse(QueryResult<Object?> response) {
    if (!response.hasException && response.data != null) {
      return response;
    } else if (response.hasException) {
      throw ClientException(
        response.exception!.linkException.toString(),
        001,
      );
    }
    throw ServerException(response.exception!.graphqlErrors[0].message, 002);
  }
}
