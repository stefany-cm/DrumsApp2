
import 'package:drumsapp2/src/models/RespRhythm.dart';
import 'package:drumsapp2/src/pages/principal/modules/rhythms/view_rhythms.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:get/get.dart';

class RhythmsController extends GetxController {
  List<RespRhythm> _listResp = [];

  List<RespRhythm> get listResp => _listResp;

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
    _listResp = await consl.getRhythmAll();
    update(['listRhythms']);
  }

  showMatrizRhythms(RespRhythm resp) {
    Get.to(ViewRhythms(), arguments: resp);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
    this.loadResp();
  }
}
