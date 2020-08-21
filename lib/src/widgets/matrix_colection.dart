
import 'package:drumsapp2/src/utils/sounds_util.dart';
import 'package:drumsapp2/src/widgets/instrument_matrix.dart';
import 'package:drumsapp2/src/widgets/tools_instrument_matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixCollection extends StatefulWidget {

  final List<List<int>> matrix;
  final String nameRhythms;
  const MatrixCollection({Key key, this.matrix, this.nameRhythms}) : super(key: key);

  @override
  _MatrixCollectionState createState() => _MatrixCollectionState();
}

class _MatrixCollectionState extends State<MatrixCollection> {

  bool state = true;
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
    
    return SingleChildScrollView(
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
                  instrumentMatrix(widget.matrix)
                ],
              ),
              pseudoSheetMusic(widget.matrix[0].length, MediaQuery.of(context).size.width, widget.nameRhythms)
            ],
          ),
        ),
      );
  }
   @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  _startButtonSet(){
    playMatrix(widget.nameRhythms);
  }

  _pauseButtonSet(){
    pauseMatrix();
  }

  _stopButtonSet(){
    stopMatrix();
  }

  _changeSwitchMetronome(bool value) {
    setState(() {
      state = value;
    });
  }

  _changeSpeedSlider(double value) {
    setState(() {
      rating = value;
      print(rating);
    });
  }
}