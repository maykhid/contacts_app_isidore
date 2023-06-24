import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  // core
  sl.registerLazySingleton(NavigationService.new);
}
