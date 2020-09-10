import 'package:drumsapp2/src/utils/sounds_util.dart';
import 'package:flutter/material.dart';

Widget instrumentMatrix(List<List<int>> matrix) {
  List<Widget> myRowChildren = [];
  List<List<Widget>> instruments = [];
  List<Widget> columnInstruments = [];

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] == 1) {
        columnInstruments.add(buttonInstrument(i, j));
      } else {
        columnInstruments.add(buttonEmpty(i, j));
      }
    }
    instruments.add(columnInstruments);
    columnInstruments = [];
  }
  print(instruments);

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

Widget buttonInstrument(int i, int j) {
  String _nameInstrumentImage;
  switch (i) {
    case 0:
      {
        _nameInstrumentImage = 'platillo';
      }
      break;
    case 1:
      {
        _nameInstrumentImage = 'tambor';
      }
      break;
    case 2:
      {
        _nameInstrumentImage = 'bombo';
      }
      break;
  }
  return GestureDetector(
    onTap: () => {
      playInstrument(i),
    },
    child: Image(
      image: AssetImage('assets/instruments/$_nameInstrumentImage.png'),
      fit: BoxFit.cover,
      height: 40,
    ),
  );
}

Widget buttonEmpty(int i, int j) {
  return GestureDetector(
    onTap: () => {},
    child: Image( //Está perfecto el repertorio para ultimar detalles en las entregas académicas
        image: AssetImage('assets/instruments/vacio.png'),
        fit: BoxFit.cover,
        height: 40),
  );
}

Widget pseudoSheetMusic(int time, double width, String pseudo, String exercises,
    BuildContext context) {
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
