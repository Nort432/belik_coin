import 'package:belik_coin/src/features/coin_details/presentation/page/coin_details.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String startPage = '/';

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoutes() {
    return (RouteSettings routeSettings) {
      switch (routeSettings.name) {
        case startPage:
          return _buildRoute(routeSettings, const CoinDetails());

        default:
          return _buildRoute(routeSettings, const CoinDetails());
      }
    };
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static MaterialPageRoute goTo(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static void Function()? myPushReplacement(
      BuildContext context, Widget widget) {
    return () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    };
  }

  static void Function()? myPush(BuildContext context, Widget widget) {
    return () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    };
  }
}
