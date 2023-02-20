import 'package:flutter/material.dart';
import 'package:photos/utils/screen_helper.dart';

abstract class NavigationRoute {
  static const main = '/';
  static const detailed = '/detailed';
}

class Navigation {
  static final _screenHelper = ScreenHelper();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.main: (_) => _screenHelper.mainScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoute.detailed:
        final arguments = settings.arguments;
        final id = arguments is String ? arguments : 'ZKEaNsKdMwA';
        return MaterialPageRoute(
          builder: (_) => _screenHelper.detailedScreen(id),
        );
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
