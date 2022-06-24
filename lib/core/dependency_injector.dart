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
}

Future<void> init() async => _init();
