import 'package:flutter/material.dart';
import 'package:photos/utils/screen_helper.dart';

abstract class NavigationRoute {
  static const main = '/';
  static const detailed = '/detailed';
  static const search = '/search';
  static const searchResult = '/search/results';
}

class Navigation {
  static final _screenHelper = ScreenHelper();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.main: (_) => _screenHelper.mainScreen(),
    NavigationRoute.search: (_) => _screenHelper.searchScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoute.detailed:
        final arguments = settings.arguments;
        final id = arguments is String ? arguments : 'ZKEaNsKdMwA';
        return MaterialPageRoute(
          builder: (_) => _screenHelper.detailedScreen(id),
        );
      case NavigationRoute.searchResult:
        final arguments = settings.arguments;
        final query = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenHelper.searchResultScreen(query),
        );
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
