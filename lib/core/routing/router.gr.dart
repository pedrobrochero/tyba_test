// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/auth/presentation/pages/login_page.dart' as _i1;
import '../../features/auth/presentation/pages/splashscreen.dart' as _i2;
import '../../features/restaurant_search/presentation/pages/home.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    SplashscreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashscreenPage());
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginRoute.name, path: '/'),
        _i4.RouteConfig(SplashscreenRoute.name, path: '/splashscreen-page'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SplashscreenPage]
class SplashscreenRoute extends _i4.PageRouteInfo<void> {
  const SplashscreenRoute()
      : super(SplashscreenRoute.name, path: '/splashscreen-page');

  static const String name = 'SplashscreenRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}
