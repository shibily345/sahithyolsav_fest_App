import 'package:get/get.dart';

import '../../back_end/spreadsheet/user_sheets_api.dart';
import '../login/controller.dart';
import 'state.dart';

class HomeController extends GetxController {
  final LoginController lController = Get.put(LoginController());

  HomeController();
  final title = "HowAreYou .";
  final state = HomeState();
  int activeIndex = 0;

  void initUser() {
    final user = UserSheetsApi.getById(lController.IdController.text);
    // final name = user == null ? '' : user!.name;
    // final id = user == null ? '' : user!.id;
    // final Category = user == null ? '' : user!.category;
    // final unit = user == null ? '' : user!.unit;
  }

  Future getUsers(String id) async {
    final user = await UserSheetsApi.getById(id);
    print(user!.toJson());
  }
}
