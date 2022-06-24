import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splashscreen.dart';
import '../../features/restaurant_search/presentation/pages/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: SplashscreenPage),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
