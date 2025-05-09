import 'package:get_it/get_it.dart';
import 'package:nyt_flutter_app/services/api_services.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ApiService());
}
