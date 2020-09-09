
import 'package:drumsapp2/src/models/RespPractice.dart';
import 'package:drumsapp2/src/pages/principal/modules/exercises/view_exercisesV2.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:get/get.dart';

class ExercisesController extends GetxController {
  List<RespPractice> _listResp = [];

  List<RespPractice> get listResp => _listResp;

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
    _listResp = await consl.getExercisesAll();
    update(['listExercises']);
  }

  showMatrizExercises(RespPractice resp) {
    Get.to(ViewExercisesV2(), arguments: resp);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
    this.loadResp();
  }
}
