// import 'package:drumsapp2/src/controllers/rhythms_controller.dart';

import 'package:drumsapp2/src/models/RespPractice.dart';
// import 'package:drumsapp2/src/pages/principal/modules/Matriz/view_rhythms.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class MatrizControllerE extends GetxController {
  List<List<int>> _listResp = [];

  List<List<int>> get listResp => _listResp;

  RespPractice _rhythm;
  bool _loadind = true;
  bool get loading => _loadind;
  RespPractice get rhythm => _rhythm;

  String _name = "";

  String get name => _name;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    print("same as inistState MatrizControllerE");
    print("get ${Get.arguments}");
    this._rhythm = Get.arguments as RespPractice;
    this._name = this._rhythm.name;
    print("object " + _loadind.toString());

    this.loadResp(this._rhythm.id);

    print("get ${this._rhythm}");
  }

  Future<void> loadResp(int id) async {
    PartitureProvider consl = new PartitureProvider();
    _listResp = await consl.getPartiture(id);
    update(['matriz']);

    _loadind = false;

    print("object " + _loadind.toString());
    print("object " + _listResp.toString());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady matriz");
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
    print("onClose matrizEjer");
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onStart() {
    // TODO: implement onStart
    super.onStart();
    print("onStart matriz");
  }
}
