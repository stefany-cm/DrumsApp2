
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("same as inistState");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
  }

  void increment() {
    this._counter++;
    update(['text']);
  }
}
