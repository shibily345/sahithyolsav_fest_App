import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/routes/names.dart';
import 'package:sahithyolsav_app/ui/home/Widgets/bottom_nav.dart';
import 'package:sahithyolsav_app/ui/home/index.dart';
import 'package:sahithyolsav_app/ui/home/visitor_home.dart';
import 'package:sahithyolsav_app/ui/login/candidate.dart';
import 'package:sahithyolsav_app/ui/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/slsnamelogo.png"))),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/slslogoT.png"))),
                ),
                MaterialButton(
                    child: Text(
                      "Candidate",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(CandidateLoginPage());
                    },
                    color: Colors.blue,
                    minWidth: 250,
                    height: 55,
                    shape: StadiumBorder()),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    child: Text(
                      "Visitor",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(NavigationPage());
                    },
                    color: Colors.green,
                    minWidth: 250,
                    height: 55,
                    shape: StadiumBorder())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
