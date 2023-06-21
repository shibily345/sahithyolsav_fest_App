import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user_sheets_api.dart';

import '../home/Widgets/bottom_nav.dart';

class CandidateLoginPage extends StatefulWidget {
  const CandidateLoginPage({super.key});

  @override
  State<CandidateLoginPage> createState() => _CandidateLoginPageState();
}

class _CandidateLoginPageState extends State<CandidateLoginPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController shift = TextEditingController();
  late TextEditingController nameController;
  late TextEditingController IdController;
  late TextEditingController categoryController;
  late TextEditingController unitController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  User? user;
  final Units = [
    'Unit 1',
    'Unit 2',
    'Unit 3',
    'Unit 4',
    'Unit 5',
  ];
  final categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ];
  String? unitValue;
  String? cateValue;
  void initUser() {
    nameController = TextEditingController();
    IdController = TextEditingController();
    categoryController = TextEditingController();
    unitController = TextEditingController();
  }

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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 80),
                  buildName(),
                  buildId(),
                  //buildUnit(),
                  buildDpCategory(),
                  buildDpUnit(),
                  ElevatedButton(
                    onPressed: () async {
                      final form = formKey.currentState!;
                      final isValid = form.validate();
                      final idn = await UserSheetsApi.getRowCount() + 1;

                      if (isValid) {
                        final user1 = User(
                            id: IdController.text,
                            name: nameController.text,
                            category: cateValue.toString(),
                            unit: unitValue.toString());
                        final newUser = user1.copy(idn: idn);
                        await UserSheetsApi.insert([newUser.toJson()]);
                        await getUsers(IdController.text);

                        if (nameController.text == user!.name) {
                          Get.to(NavigationPage(
                            user: user,
                          ));
                        }
                      }
                    },
                    child: Text("GO"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue.shade400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
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
      this.user = user;
    });
  }

  Padding buildCatogory() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: categoryController,
        decoration: InputDecoration(
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
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: IdController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          labelText: 'Chest No',
          hintText: 'Enter Your Chest no',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.phone,
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter cn' : null,
      ),
    );
  }

  Widget buildName() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Enter Your name',
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(color: Colors.white),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter name' : null,
      ),
    );
  }

  Widget buildDpUnit() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 245, 242, 242)),
            borderRadius: BorderRadius.circular(10)),
        //width: 280,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      isExpanded: true,
                      hint: Text(
                        "Select Unit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      value: unitValue,
                      items: Units.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.unitValue = value;
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 241, 237, 237)),
            borderRadius: BorderRadius.circular(10)),
        //width: 280,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: const Color.fromARGB(255, 247, 245, 245),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      isExpanded: true,
                      hint: Text(
                        "Select Category",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      value: cateValue,
                      items: categories.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.cateValue = value;
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
        id: IdController.text,
        name: nameController.text,
        category: categoryController.text,
        unit: unitValue.toString(),
      )
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();

    await UserSheetsApi.insert(jsonUsers);
  }

  DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
        value: item,
      );
}
