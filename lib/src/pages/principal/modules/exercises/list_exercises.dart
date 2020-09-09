import 'package:drumsapp2/src/widgets/matrix_colection.dart';
import 'package:flutter/material.dart';

class ListExercises extends StatefulWidget {
  final matrix;
  final String level;

  ListExercises({Key key, this.matrix, this.level}) : super(key: key);

  @override
  _ListExercisesState createState() => _ListExercisesState();
}

class _ListExercisesState extends State<ListExercises> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MatrixCollection(matrix: widget.matrix, nameRhythms:  widget.level),
    );
  }
}
