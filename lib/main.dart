import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/control_classes/status.dart';
import 'core/dependency_injector.dart' as service_locator;
import 'core/dependency_injector.dart';
import 'core/routing/router.gr.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await service_locator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status is LoadingStatus) {
              _appRouter.replaceAll([const SplashscreenRoute()]);
              return;
            }
            if (state.isAuthenticated) {
              const homeRoute = HomeRoute();
              _appRouter.replaceAll([homeRoute]);
              return;
            }
            _appRouter.replaceAll([const LoginRoute()]);
          },
          child: MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            title: 'Tyba',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      );
}
