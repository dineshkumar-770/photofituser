import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());
  // getIt.registerSingleton(
  //   //Any Class of which you want to save data using shared prefrences
  // );
}
