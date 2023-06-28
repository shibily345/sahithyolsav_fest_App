import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/ui/home/Widgets/bottom_nav.dart';
import 'package:sahithyolsav_app/ui/login/candidate.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalId;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      gotoLogin();
    });
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
              child: Container(
            height: 300,
            width: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/slsnamelogo.png"))),
          )),
        ),
        Positioned(
            bottom: 10,
            left: 150,
            child: Container(
              height: 60,
              width: 100,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/label.png"))),
            ))
      ],
    );
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedId = sharedPreferences.getString('id');
    setState(() {
      finalId = obtainedId;
    });
    print(finalId);
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(finalId == null
        ? () => const CandidateLoginPage()
        : () => const NavigationPage());
  }
}
