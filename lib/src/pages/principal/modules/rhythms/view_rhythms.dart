import 'package:drumsapp2/src/controllers/matriz_controller.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/matrix_colection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewRhythms extends StatefulWidget {
  final List<List<int>> matrix;
  final String nameRhythms;

  ViewRhythms({Key key, this.matrix, this.nameRhythms}) : super(key: key);

  @override
  _ViewRhythmsState createState() => _ViewRhythmsState();
}

class _ViewRhythmsState extends State<ViewRhythms> {
  //List<List<int>> matrix = [[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatrizController>(
        init: MatrizController(),
        builder: (_) => Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: linearAppBar(_.name, orangeColor, context)),
              body:
                  // if(CircularProgressIndicator()){

                  // }else{

                  // }

                  MatrixCollection(matrix: _.listResp, nameRhythms: _.name),
            ));
  }
}
