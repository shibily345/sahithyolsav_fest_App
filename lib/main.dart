import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/ui/home/view.dart';
import 'package:sahithyolsav_app/ui/splash/index.dart';

import 'back_end/spreadsheet/user_sheets_api.dart';
import 'routes/names.dart';
import 'routes/pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.splash,
      getPages: AppPages.routes,
      home: SplashPage(),
    );
  }
}
