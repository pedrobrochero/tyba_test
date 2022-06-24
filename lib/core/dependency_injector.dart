// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';

import '../features/auth/data/datasources/firebase_auth_provider.dart';
import '../features/auth/data/datasources/google_sign_in_provider.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/get_session_data.dart';
import '../features/auth/domain/usecases/login_with_google.dart';
import '../features/auth/domain/usecases/logout.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/restaurant_search/data/data_sources/logger_data_source.dart';
import '../features/restaurant_search/data/data_sources/search_restaurants_remote_data_source.dart';
import '../features/restaurant_search/data/repositories/logger_repository.dart';
import '../features/restaurant_search/data/repositories/search_restaurants_repository_impl.dart';
import '../features/restaurant_search/domain/repositories/logger_repository.dart';
import '../features/restaurant_search/domain/repositories/search_restaurants_repository.dart';
import '../features/restaurant_search/domain/usecases/search_restaurants.dart';
import '../features/restaurant_search/presentation/bloc/restaurants_search_cubit.dart';
import 'providers/sqlite_provider.dart';

final sl = GetIt.instance;

Future<void> _init() async {
  //! Feature: Auth
  // Bloc
  sl.registerLazySingleton(() => AuthCubit(sl(), sl(), sl()));
  // Usecase
  sl.registerLazySingleton(() => LoginWGoogle(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetSessionData(sl()));
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));
  // Data sources
  sl.registerLazySingleton<FirebaseAuthProvider>(FirebaseAuthProviderImpl.new);
  sl.registerLazySingleton<GoogleSignInProvider>(GoogleSignInProviderImpl.new);
  //! Feature: Search restaurants
  // Bloc
  sl.registerFactory(() => RestaurantsSearchCubit(sl()));
  // Usecases
  sl.registerLazySingleton(() => SearchRestaurants(sl(), sl()));
  // Repos
  sl.registerLazySingleton<SearchRestaurantsRepository>(
      () => SearchRestaurantsRepositoryImpl(sl()));
  sl.registerLazySingleton<LoggerRepository>(() => LoggerRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<SearchRestaurantsRemoteDataSource>(
      DummySearchRestaurantsRemoteDataSourceImpl.new);
  sl.registerLazySingleton<LoggerDataSource>(() => LoggerDataSourceImpl(sl()));
  //! External providers/plugins
  final sqlite = await SqliteProvider.getInstance();
  sl.registerSingleton(sqlite);
}

Future<void> init() async => _init();
