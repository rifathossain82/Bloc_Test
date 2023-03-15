import 'package:bloc_test/src/features/news/view/news_screen.dart';
import 'package:bloc_test/src/features/services/view/service_screen.dart';
import 'package:bloc_test/src/features/settings/view/settings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String service = '/';
  static const String news = '/news';
  static const String settings = '/settings';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case service:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case news:
        return MaterialPageRoute(builder: (_) => const NewsScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
    }
  }
}
