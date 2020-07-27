import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/matrix_colection.dart';
import 'package:flutter/material.dart';


class BaladaRhythms extends StatefulWidget {
  BaladaRhythms({Key key}) : super(key: key);

  @override
  _BaladaRhythmsState createState() => _BaladaRhythmsState();
}

class _BaladaRhythmsState extends State<BaladaRhythms> {
  List<List<int>> matrix = [[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: linearAppBar('Balada', orangeColor, context)),
      body: MatrixCollection(matrix: matrix),
    );
  }
}