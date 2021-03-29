// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../notes/note_overview/notes_overview_page.dart' as _i5;
import '../sign_in/sign_in_page.dart' as _i3;
import '../sign_up/sign_up_page.dart' as _i4;
import '../splash/splash_page.dart' as _i2;

class Router extends _i1.RootStackRouter {
  Router();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i2.SplashPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    SignInPageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.SignInPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    SignUpPageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.SignUpPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    NotesOverviewPageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.NotesOverviewPage(),
          maintainState: true,
          fullscreenDialog: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPageRoute.name,
            path: '/', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SignInPageRoute.name,
            path: '/sign-in-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SignUpPageRoute.name,
            path: '/sign-up-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(NotesOverviewPageRoute.name,
            path: '/notes-overview-page',
            fullMatch: false,
            usesTabsRouter: false)
      ];
}

class SplashPageRoute extends _i1.PageRouteInfo {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

class SignInPageRoute extends _i1.PageRouteInfo {
  const SignInPageRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

class SignUpPageRoute extends _i1.PageRouteInfo {
  const SignUpPageRoute() : super(name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

class NotesOverviewPageRoute extends _i1.PageRouteInfo {
  const NotesOverviewPageRoute() : super(name, path: '/notes-overview-page');

  static const String name = 'NotesOverviewPageRoute';
}
