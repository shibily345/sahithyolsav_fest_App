import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sahithyolsav_app/ui/login/candidate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/slsnamelogo.png')),
              color: Color.fromARGB(255, 244, 246, 247),
            ),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle the Home item tap
              Navigator.pop(context); // Close the drawer
              // Add your navigation code here
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.logout),
            title: const Text('LogOut'),
            onTap: () async {
              EasyLoading.show();
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('id').whenComplete(() {
                EasyLoading.dismiss();
              });
              Get.offAll(const CandidateLoginPage());
            },
          ),
        ],
      ),
    );
  }
}
