import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wanderwith/model/mountains.dart';
import 'package:wanderwith/screens/landing_page.dart';
import 'package:wanderwith/screens/single_page.dart';

import 'routes.dart';
import 'screens/home_page.dart';
import 'screens/image_viewer.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // Set to true
      locale: DevicePreview.locale(context),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      initialRoute: Routes.landingPage,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.landingPage:
              return const LandingPage();
            case Routes.homePage:
              return const HomePage();
            case Routes.singlePage:
              final args = settings.arguments as Mountains;
              return SinglePage(mountains: args);
            case Routes.imageViewer:
              final args = settings.arguments;
              if (args is String) {
                return ImageViewer(args);
              } else {
                return const ImageViewer('null');
              }
            default:
              return const SizedBox.shrink();
          }
        });
      },
    );
  }
}
