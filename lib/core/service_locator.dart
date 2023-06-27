import 'package:contacts_app_isidore/app/feature/home/data/data_source/remote/contacts_data_source.dart';
import 'package:contacts_app_isidore/app/feature/home/data/data_source/remote/graph_ql_contacts_data_source.dart';
import 'package:contacts_app_isidore/app/feature/home/data/repository/contacts_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/graph_ql_sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/graph_ql_sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/data_source/remote/sign_up_data_source.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/repository/sign_up_repository.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/graph_ql_client/graph_ql_client.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/keys.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  final token = await secureStorage.read(key: AppStorageKeys.tokenKey);
  // graphQL client
  GraphQLClient createClient() {
    final httpLink = HttpLink(
      'https://demo.isidoreagric.co',
      defaultHeaders: {'Authorization': 'Bearer ${token ?? ''}'},
    );

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
      () => SignInRepository(signInDataSource: sl(), secureStorage: sl()),
    )

    // register contact datasource
    ..registerLazySingleton<ContactsDataSource>(
      () => GraphQLContactsDataSource(client: sl()),
    )
    // register contact Repository
    ..registerLazySingleton<ContactsRepository>(
      () => ContactsRepository(contactsDataSource: sl()),
    )
    // navigation
    ..registerLazySingleton(NavigationService.new)
    ..registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
}
