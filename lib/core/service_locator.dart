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
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    // resister graphQl client
    ..registerLazySingleton<IClient>(
      GraphQLClientImpl.new,
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
      () => SignInRepository(signInDataSource: sl(), sharedPreferences: sl()),
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
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
