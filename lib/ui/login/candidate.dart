import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user_sheets_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/Widgets/bottom_nav.dart';
import 'controller.dart';

class CandidateLoginPage extends StatefulWidget {
  const CandidateLoginPage({super.key});

  @override
  State<CandidateLoginPage> createState() => _CandidateLoginPageState();
}

class _CandidateLoginPageState extends State<CandidateLoginPage> {
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade400,
                Colors.purple.shade400,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 80),
                  buildName(),
                  buildId(),
                  //buildUnit(),
                  buildDpCategory(),
                  buildDpUnit(),
                  ElevatedButton(
                    onPressed: () async {
                      controller.goLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue.shade400,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("GO"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controller.goLoginNAC();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(80, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Not a Candidate"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getUsers(String id) async {
    final user = await UserSheetsApi.getById(id);
    print(user!.toJson());
    setState(() {
      controller.user = user;
    });
  }

  Padding buildCatogory() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller.categoryController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Category',
          hintText: 'Enter Your Category',
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter category' : null,
      ),
    );
  }

  Widget buildId() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller.IdController,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          labelText: 'Chest No',
          hintText: 'Enter Your Chest no',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.phone,
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter cn' : null,
      ),
    );
  }

  Widget buildName() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller.nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Enter Your name',
          hintStyle: const TextStyle(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter name' : null,
      ),
    );
  }

  Widget buildDpUnit() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 245, 242, 242)),
            borderRadius: BorderRadius.circular(10)),
        //width: 280,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      isExpanded: true,
                      hint: const Text(
                        "Select Unit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      value: controller.unitValue,
                      items: controller.Units.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          controller.unitValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDpCategory() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 241, 237, 237)),
            borderRadius: BorderRadius.circular(10)),
        //width: 280,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 247, 245, 245),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      isExpanded: true,
                      hint: const Text(
                        "Select Category",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      value: controller.cateValue,
                      items: controller.categories.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          controller.cateValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future insertUser() async {
    final users = [
      User(
        id: controller.IdController.text,
        name: controller.nameController.text,
        category: controller.categoryController.text,
        unit: controller.unitValue.toString(),
      )
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();

    await UserSheetsApi.insert(jsonUsers);
  }

  DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
