import 'package:flutter/foundation.dart';
import 'package:drumsapp2/src/utils/sounds_util.dart';
import 'package:flutter/material.dart';

class InstrumentMatrixExercises extends StatefulWidget {
  final List<List<int>> matrix;
  InstrumentMatrixExercises({Key key, @required this.matrix}) : super(key: key);

  @override
  _InstrumentMatrixExercisesState createState() =>
      _InstrumentMatrixExercisesState();  

  

  List<List<int>> compare = List.generate(3, (i) => List.filled(8, 0), growable: false);
  bool verification;
  get getCompare => compare;
  set setCompare(List<List<int>> value) {
    compare = value;
  }

  get getVerification => verification;
  set setVerification(bool value) {
    verification = value;
  }

  void verificationExercises() {
    (compare == matrix) ? setVerification = true : setVerification = false;
  }
}

class _InstrumentMatrixExercisesState extends State<InstrumentMatrixExercises> {
  List<List<int>> aux;

  @override
  void initState() {
    aux = List.generate(
        widget.matrix.length, (i) => List.filled(widget.matrix[0].length, 0),
        growable: false);
    widget.setCompare = aux;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];
    List<List<GestureDetectorButtonMatrix>> instruments = [];
    List<GestureDetectorButtonMatrix> columnInstruments = [];

    for (int i = 0; i < aux.length; i++) {
      for (int j = 0; j < aux[i].length; j++) {
        GestureDetectorButtonMatrix btn =
            GestureDetectorButtonMatrix(i: i, j: j, instrumentMatrixExercises: widget);
        aux[i][j] = btn.getPress;
        widget.verificationExercises();
        print("${widget.getVerification} ***********************************************************************");
        columnInstruments.add(btn);
      }
      instruments.add(columnInstruments);
      columnInstruments = [];
    }
    myRowChildren = instruments
        .map(
          (columns) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: columns.map((nr) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey[300],
                  width: 1,
                )),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: nr,
              );
            }).toList(),
          ),
        )
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: myRowChildren,
    );
  }
}

Widget pseudoSheetMusicExercises(int time, double width, String pseudo,
    String exercises, BuildContext context) {
  //print(time.toDouble());
  return Builder(builder: (context) {
    if (pseudo == null) {
      return Container(
        width: width,
        height: 120,
        alignment: Alignment.topRight,
        child: Image(
          image: AssetImage('assets/exercises/$exercises.JPG'),
          fit: BoxFit.cover,
          //width: ((width*0.108)*time.toDouble()),
        ),
      );
    } else {
      return Container(
        width: width,
        height: 120,
        alignment: Alignment.topRight,
        child: Image(
          image: AssetImage('assets/musicsheet/$pseudo.JPG'),
          fit: BoxFit.cover,
          //width: ((width*0.108)*time.toDouble()),
        ),
      );
    }
  });
}

Widget pseudoSheetExercises(int time, double width, String pseudo) {
  //print(time.toDouble());
  return Container(
    width: width,
    height: 120,
    alignment: Alignment.topRight,
    child: Image(
      image: AssetImage('assets/musicsheet/$pseudo.JPG'),
      fit: BoxFit.cover,
      //width: ((width*0.108)*time.toDouble()),
    ),
  );
}

Widget pseudoSheet(int time, double width, String pseudo) {
  //print(time.toDouble());
  return Container(
    width: width,
    height: 120,
    alignment: Alignment.topRight,
    child: Image(
      image: AssetImage('assets/musicsheet/$pseudo.JPG'),
      fit: BoxFit.cover,
      //width: ((width*0.108)*time.toDouble()),
    ),
  );
}

class GestureDetectorButtonMatrix extends StatefulWidget {
  final int i, j;
  List<List<int>> auxi = List.generate(3, (i) => List.filled(8, 0), growable: false);
  InstrumentMatrixExercises instrumentMatrixExercises;
  int _press;
  GestureDetectorButtonMatrix({Key key, this.i, this.j, this.instrumentMatrixExercises}) : super(key: key);

  @override
  _GestureDetectorButtonMatrixState createState() =>
      _GestureDetectorButtonMatrixState();

  get getPress => _press;
  set setPress(int value) {
    _press = value;
  }
}

class _GestureDetectorButtonMatrixState
    extends State<GestureDetectorButtonMatrix> {
  Image img, imgDown;
  Image imgUp = Image(
    image: AssetImage('assets/instruments/vacio.png'),
    fit: BoxFit.cover,
    height: 40,
  );

  @override
  void initState() {
    super.initState();
    img = imgUp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: img,
      onTapUp: (tap) {
        setState(() {
          playInstrument(widget.i);
          widget.setPress = 1;
          widget.auxi = widget.instrumentMatrixExercises.getCompare;
          widget.auxi[widget.i][widget.j] = 1;
          widget.instrumentMatrixExercises.setCompare = widget.auxi;
          img = imgDownChange(widget.i);
        });
      },
      onTapDown: (tap) {
        setState(() {
          widget.auxi = widget.instrumentMatrixExercises.getCompare;
          widget.auxi[widget.i][widget.j] = 0;
          widget.instrumentMatrixExercises.setCompare = widget.auxi;
          widget.setPress = 0;
          img = imgUp;
        });
      },
    );
  }

  Image imgDownChange(int i) {
    String nameInstrumentImage;
    switch (i) {
      case 0:
        nameInstrumentImage = 'platillo';
        break;
      case 1:
        nameInstrumentImage = 'tambor';
        break;
      case 2:
        nameInstrumentImage = 'bombo';
        break;
    }
    return Image(
      image: AssetImage('assets/instruments/$nameInstrumentImage.png'),
      fit: BoxFit.cover,
      height: 40,
    );
  }
}
