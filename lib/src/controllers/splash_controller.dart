import 'package:drumsapp2/src/controllers/home_controller.dart';
import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose

    print("on Close");
    super.onClose();
  }
}
