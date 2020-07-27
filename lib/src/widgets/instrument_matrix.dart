import 'package:drumsapp2/src/utils/sounds_util.dart';
import 'package:flutter/material.dart';
import 'package:sheet_music/sheet_music.dart';

Widget instrumentMatrix(List<List <int>> matrix) {
  List<Widget> myRowChildren = [];
  List<List<Widget>> instruments = [];
  List<Widget> columnInstruments = [];
  
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      int z = matrix[i][j];
      print("add [$i, $j] = $z");
      if (matrix[i][j] == 1) {
        columnInstruments.add(buttonInstrument(i, j));
      }else {
         columnInstruments.add(buttonEmpty(i, j));
      }
    }
    print("------------\n");
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
    case 0: {_nameInstrumentImage = 'tambor';}
      break;
    case 1: {_nameInstrumentImage = 'platillo';}
      break;
    case 2: {_nameInstrumentImage = 'bombo';}
      break;
  }
  return GestureDetector(
    onTap: () => {
      print('click on [$i, $j]'),
      play(i),
    },
    child: Image(
      image: AssetImage('assets/$_nameInstrumentImage.png'),
      fit: BoxFit.cover,
      height: 40,
    ),
  );
}
Widget buttonEmpty(int i, int j) {
    return GestureDetector(
    onTap: () => {print('click on [$i, $j]')},
    child: Image(
      image: AssetImage('assets/vacio.png'),
      fit: BoxFit.cover,
      height: 40
    ),
  );
}

Widget pseudoSheetMusic(List<List <int>> matrix) {
  instrumentMatrix(matrix);
  return Container(
    child: SheetMusic( 
      scale: "C Major", //DO MAJOR
      pitch: "G5", //4/4
      trebleClef: true,
      hide: false
    ),
  );
}