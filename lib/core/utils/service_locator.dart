import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_clean/core/api/api_consumer.dart';
import 'package:quotes_clean/core/api/dio_consumer.dart';
import 'package:quotes_clean/features/quote/data/repositories/quote_repo_impl.dart';
import 'package:quotes_clean/features/quote/domain/repositories/base_repo.dart';
import 'package:quotes_clean/features/quote/domain/usecases/get_randam_quote_use_case.dart';
import 'package:quotes_clean/features/quote/presentaion/controller/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/splash/domain/repositories/base_lang_repo.dart';
import 'package:quotes_clean/features/splash/domain/use_cases/change_lang.dart';
import 'package:quotes_clean/features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:quotes_clean/features/splash/presentation/controller/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../features/quote/data/datasource/local_data_source.dart';
import '../../features/quote/data/datasource/remote_data_source.dart';
import '../../features/splash/data/data_sources/lang_local_data_source.dart';
import '../../features/splash/data/repositories/lang_repo_impl.dart';
import '../api/data_interceptors.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //blocs
  getIt.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: getIt()));
  getIt.registerFactory<LocalCubit>(() =>
      LocalCubit(getSavedLangUseCase: getIt(), changeLangUseCase: getIt()));

  //usecases
  getIt.registerLazySingleton<GetRandomQuoteUseCase>(
      () => GetRandomQuoteUseCase(base_repo: getIt()));
  getIt.registerLazySingleton<GetSavedLangUseCase>(
          () => GetSavedLangUseCase(baseLangRepo: getIt()));
  getIt.registerLazySingleton<ChangeLangUseCase>(
          () => ChangeLangUseCase(baseLangRepo: getIt()));
  //repo
  getIt.registerLazySingleton<BaseRepo>(() => QuoteRepoImpl(
      baseRemoteDataRource: getIt(),
      networkInfo: getIt(),
      baseLocalDataSource: getIt()));
  getIt.registerLazySingleton<BaseLangRepo>(() =>langRepoImpl(
      baseLangLocalDataSource: getIt(),

  ));
  //datasources
  getIt.registerLazySingleton<BaseRemoteDataRource>(
      () => RemoteDataRource(apiConsumer: getIt()));
  getIt.registerLazySingleton<BaseLocalDataSource>(
      () => LocalDataSource(sharedPreferences: getIt()));
  getIt.registerLazySingleton<BaseLangLocalDataSource>(
      () => LangLocalDataSource(sharedPreferences:getIt()));
  //core
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: getIt()));
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => AppIntercepters());
  getIt.registerLazySingleton(() => LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true));
}
