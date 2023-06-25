import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/graph_ql_sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/graph_ql_sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/repository/sign_up_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/graph_ql_client.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  // graphQL client
  GraphQLClient createClient() {
    final httpLink = HttpLink('https://demo.isidoreagric.co');

    final Link link = httpLink;

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  sl
    ..registerLazySingleton(createClient) // resister graphQl client
    ..registerLazySingleton<IClient>(
      () => GraphQLClientImpl(
        graphQLClient: sl(),
      ),
    )
    // register signup data source
    ..registerLazySingleton<SignUpDataSource>(
      () => GraphQLSignUpDataSource(client: sl()),
    )
    // register sign up repository
    ..registerLazySingleton<SignUpRepository>(
      () => SignUpRepository(signUpDataSource: sl()),
    )
    // register signin data source
    ..registerLazySingleton<SignInDataSource>(
      () => GraphQLSignInDataSource(client: sl()),
    )
    // register sign in repository
    ..registerLazySingleton<SignInRepository>(
      () => SignInRepository(signInDataSource: sl()),
    )
    // navigation
    ..registerLazySingleton(NavigationService.new);
}
