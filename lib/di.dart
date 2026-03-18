import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/auth/data/usecases/login_usecase.dart'
    show LoginUsecaseImpl;
import 'package:health_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:health_app/shared/api/api_repositories2.dart';
import 'package:health_app/shared/api/api_service2.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';

export './shared/api/api_repositories2.dart' show AppRepositories;

final di = GetIt.instance;

AppStorage get appStorage => di<AppStorage>();

AppRepositories get appRepo => di<AppRepositories>();

Dio get getDio => di<AppRepositories>().getDio();

Future<void> initDi() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton<AppStorage>(() => AppStorage(sharedPreferences));

  di.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  di.registerFactory<DioFactory>(() => DioFactory(di()));

  di.registerFactory<ApiService>(() => ApiService(di()));
  di.registerFactory<AppRepositories>(
    () => AppRepositories(api: di(), storage: di()),
  );

  di.registerFactory<LoginUsecase>(() => LoginUsecaseImpl(di()));
  // di.registerFactory<RegisterUsecase>(
  //   () => RegisterUsecaseImpl(dio: di(), storage: di()),
  // );
}
