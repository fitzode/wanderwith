import 'package:flutter/cupertino.dart';

class Routes {
  static const landingPage = 'landing_page';
  static const homePage = 'home_page';
  static const singlePage = 'single_page';
  static const imageViewer = 'image_viewer';
  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        });
  }
}
