import 'dart:developer';

import 'package:drumsapp2/src/models/RespTheoryAndSub.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:get/get.dart';

class TheoryController extends GetxController {
  List<RespTheoryAndSub> _listResp = [];

  List<RespTheoryAndSub> get listResp => _listResp;

  int _counter = 0;

  int get counter => _counter;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("same as inistState");
  }

  Future<void> loadResp() async {
    PartitureProvider consl = new PartitureProvider();
    _listResp = await consl.getTheoryAndSub();
    update(['listTheory']);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
    this.loadResp();
  }

  void increment() {
    this._counter++;
    update(['text']);
  }
}
