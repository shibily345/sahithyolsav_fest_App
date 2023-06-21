import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sahithyolsav_app/ui/home/index.dart';
import 'package:sahithyolsav_app/ui/splash/index.dart';

import 'names.dart';

class AppPages {
  static const splash = AppRouts.splash;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRouts.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouts.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
