import 'package:get/get.dart';
import 'package:sahithyolsav_app/ui/home/Widgets/bottom_nav.dart';

import 'state.dart';

class SplashController extends GetxController {
  SplashController();
  final title = "HowAreYou .";
  final state = SplashState();
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        const Duration(seconds: 3), () => Get.off(const NavigationPage()));
  }
}
