import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/ui/home/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../back_end/spreadsheet/user.dart';
import '../../back_end/spreadsheet/user_sheets_api.dart';
import '../home/Widgets/bottom_nav.dart';
import 'state.dart';

class LoginController extends GetxController {
  LoginController();
  final formKey = GlobalKey<FormState>();
  late TextEditingController shift = TextEditingController();
  late TextEditingController nameController;
  late TextEditingController IdController;
  late TextEditingController categoryController;
  late TextEditingController unitController;

  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    initUser();
  }

  User? user;
  final Units = [
    'Manoor ',
    'East Manoor ',
    'VattamKulam ',
    'Chekanoor ',
    'Modoor ',
    'Neeliyad',
    'Pottur',
    'Kuttippala'
  ];
  final categories = [
    'Lower Primery ',
    'Lower Primery girls',
    'Upper primery ',
    'Upper Primery girls ',
    'High School ',
    'High School girls',
    'Junier',
    'Senior',
    'General',
    'Campus',
    'Campus girls'
  ];
  String? unitValue;
  String? cateValue;
  void initUser() {
    nameController = TextEditingController();
    IdController = TextEditingController();
    categoryController = TextEditingController();
    unitController = TextEditingController();
  }

  Future<void> goLogin() async {
    EasyLoading.show();
    final form = formKey.currentState!;
    final isValid = form.validate();
    final idn = await UserSheetsApi.getRowCount() + 1;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('id', IdController.text);
    if (isValid) {
      final user1 = User(
          id: IdController.text,
          name: nameController.text,
          category: cateValue.toString(),
          unit: unitValue.toString());
      final newUser = user1.copy(idn: idn);
      await UserSheetsApi.insert([newUser.toJson()]).whenComplete(() {
        EasyLoading.dismiss();
      });
      // await getUsers(controller.IdController.text);

      Get.to(
          NavigationPage(
            user: user,
          ),
          binding: HomeBinding());
    }
  }

  Future<void> goLoginNAC() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('id', 'cdn');

    // await getUsers(controller.IdController.text);

    Get.to(
        () => NavigationPage(
              user: user,
            ),
        binding: HomeBinding());
  }

  Future getUsers(String id) async {
    final user = await UserSheetsApi.getById(id);
    print(user!.toJson());
    // setState(() {
    //   this.controller.user = user;
    // });
  }

  final title = "HowAreYou .";
  final state = LoginState();
}
