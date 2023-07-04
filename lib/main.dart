import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/ui/splash/index.dart';

import 'back_end/spreadsheet/user_sheets_api.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Primary colors
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 243, 242),
        canvasColor: Colors.grey[200],
        // Text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
          // Add more text styles as needed
        ),
      ),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const SplashPage())],

      // home: SplashPage(),
    );
  }
}
