import 'package:drumsapp2/src/controllers/matrizE_controller.dart';
import 'package:drumsapp2/src/controllers/matriz_controller.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/matrix_colection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewExercises extends StatefulWidget {
  final List<List<int>> matrix;
  final String nameExercises;

  ViewExercises({Key key, this.matrix, this.nameExercises}) : super(key: key);

  @override
  _ViewExercisesState createState() => _ViewExercisesState();
}

class _ViewExercisesState extends State<ViewExercises> {
  //List<List<int>> matrix = [[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatrizControllerE>(
        init: MatrizControllerE(),
        id: 'matriz',
        builder: (_) {
          if (_.loading) {
            return Center(
              child: LinearProgressIndicator(),
            );
          } else {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: linearAppBar(_.name, orangeColor, context)),
              body:

                  //  if(CircularProgressIndicator()){

                  //  }else{
                  // MatrixCollection(),
                  //  }
                  MatrixCollection(matrix: _.listResp, nameExercises: _.name),
            );
          }
        });
  }
}
