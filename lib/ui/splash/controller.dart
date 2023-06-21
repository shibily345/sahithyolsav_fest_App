import 'package:get/get.dart';
import 'package:sahithyolsav_app/routes/names.dart';
import 'package:sahithyolsav_app/ui/home/index.dart';

import 'state.dart';

class SplashController extends GetxController {
  SplashController();
  final title = "HowAreYou .";
  final state = SplashState();
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () => Get.off(AppRouts.home));
  }
}
