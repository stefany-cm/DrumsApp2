import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/matrix_colection.dart';
import 'package:flutter/material.dart';

class ViewExercises extends StatefulWidget {
  final matrix;
  final String level;

  ViewExercises({Key key, this.matrix, this.level}) : super(key: key);

  @override
  _ViewExercisesState createState() => _ViewExercisesState();
}

class _ViewExercisesState extends State<ViewExercises> {
  //List<List<int>> matrix = [[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: linearAppBar(widget.level, greenColor, context)),
      body: MatrixCollection(matrix: widget.matrix, nameRhythms:  widget.level),
    );
  }
}
