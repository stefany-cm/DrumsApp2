import 'package:drumsapp2/src/controllers/matriz_controller.dart';
import 'package:drumsapp2/src/utils/sounds_util.dart';
// import 'package:drumsapp2/src/widgets/instrument_matrix.dart';
import 'package:drumsapp2/src/widgets/instrument_matrixV1.dart';

import 'package:drumsapp2/src/widgets/tools_instrument_matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class MatrixCollection extends StatefulWidget {
  final List<List<int>> matrix;
  final String nameRhythms;
  final String nameExercio;
  const MatrixCollection(
      {Key key, this.matrix, this.nameRhythms, this.nameExercio})
      : super(key: key);

  // const MatrixCollection({Key key}) : super(key: key);

  @override
  _MatrixCollectionState createState() => _MatrixCollectionState();
}

class _MatrixCollectionState extends State<MatrixCollection> {
  bool state = false;
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return
        // GetBuilder<MatrizController>(
        //     // id: 'matriz',
        //     // init: MatrizController(),
        //     builder: (_) =>
        SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    buttonSet(_startButtonSet, _pauseButtonSet, _stopButtonSet),
                    switchMetronome(state, _changeSwitchMetronome),
                    speedSlider(rating, _changeSpeedSlider)
                  ],
                ),
                // instrumentMatrix(),
                // instrumentMatrix(_.listResp)
                instrumentMatrix(widget.matrix)
              ],
            ),
            // pseudoSheetMusic(_.listResp[0].length,
            //     MediaQuery.of(context).size.width, _.name)
            pseudoSheetMusic(
                widget.matrix[0].length,
                MediaQuery.of(context).size.width,
                widget.nameRhythms,
                widget.nameExercio,
                context)
          ],
        ),
      ),
    );
    // );
  }

  @override
  dispose() {
    state = false;
    _stopButtonSet();
    _changeSwitchMetronome(state);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  _startButtonSet() {
    state = true;
    stopMetronome();
    _changeSwitchMetronome(state);
    playMatrix(widget.nameRhythms);
    // playMatrix("Balada");
  }

  _pauseButtonSet() {
    pauseMatrix();
    state = false;
    _changeSwitchMetronome(state);
  }

  _stopButtonSet() {
    state = false;
    _changeSwitchMetronome(state);
    stopMatrix();
  }

  _changeSwitchMetronome(bool value) {
    setState(() {
      state = value;
    });

    if (!value) {
      stopMetronome();
    }
    if (value && !isSound) {
      // playMetronome();
      playMetronome(1);
    }
  }

  _changeSpeedSlider(double value) {
    setState(() {
      rating = value;
      print(rating);
    });
  }
}
