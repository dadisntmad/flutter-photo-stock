import 'package:flutter/material.dart';
import 'package:photos/screens/discover_screen.dart';
import 'package:photos/screens/home_screen.dart';
import 'package:photos/screens/main_screen.dart';
import 'package:photos/view_models/discover_view_model.dart';
import 'package:photos/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class ScreenHelper {
  Widget mainScreen() {
    return const MainScreen();
  }

  Widget homeScreen() {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeScreen(),
    );
  }

  Widget discoverScreen() {
    return ChangeNotifierProvider(
      create: (_) => DiscoverViewModel(),
      child: const DiscoverScreen(),
    );
  }
}
