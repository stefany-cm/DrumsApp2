import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheet_music/sheet_music.dart';

class BaladaRhythms extends StatefulWidget {
  BaladaRhythms({Key key}) : super(key: key);

  @override
  _BaladaRhythmsState createState() => _BaladaRhythmsState();
}

class _BaladaRhythmsState extends State<BaladaRhythms> {
  bool state = true;
  double rating = 0.0;
  List<List<int>> matrix = [[1, 0, 1, 0, 1, 0, 1, 2], [1, 1, 0, 0, 1, 1, 0, 2], [1, 0, 1, 0, 1, 0, 1, 2]];

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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: linearAppBar('Balada', orangeColor, context)),
      body: SingleChildScrollView(
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
                      buttonSet(),
                      switchMetronome(state, _changeSwitchMetronome),
                      speedSlider(rating, _changeSpeedSlider)
                    ],
                  ),
                  instrumentMatrix(matrix)
                ],
              ),
              pseudoSheetMusic(matrix)
            ],
          ),
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

Widget buttonSet() {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.grey[200],
    ),
    child: Row(
      children: <Widget>[
        iconButton(Icon(Icons.stop), Colors.red[300], () {}),
        iconButton(Icon(Icons.play_arrow), Colors.green[300], () {}),
        iconButton(Icon(Icons.pause), Colors.grey[300], () {}),
      ],
    ),
  );
}

Widget switchMetronome(bool state, dynamic function) {
  return Column(children: <Widget>[
    Text('Metrónomo', style: textStyleSubtitleCardShort),
    Switch(
      value: state,
      onChanged: function,
      activeColor: orangeColor,
    )
  ]);
}

Widget speedSlider(double rating, dynamic function) {
  return Column(children: <Widget>[
    Text(
      'Velocidad',
      style: textStyleSubtitleCardShort,
    ),
    Slider(
        value: rating,
        activeColor: orangeColor,
        min: 0,
        max: 100,
        divisions: 10,
        label: rating.round().toString(),
        onChanged: function)
  ]);
}

Widget instrumentMatrix(List<List <int>> matrix) {
  List<Widget> myRowChildren = [];
  List<List<Widget>> instruments = [];
  List<Widget> columnInstruments = [];
  
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      int z = matrix[i][j];
      print("add [$i, $j] = $z");
      if (matrix[i][j] == 1) {
        columnInstruments.add(_buttonInstrument(i, j));
      }else {
         columnInstruments.add(_buttonEmpty(i, j));
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

Widget _buttonInstrument(int i, int j) {
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
    onTap: () => {print('click on [$i, $j]')},
    child: Image(
      image: AssetImage('assets/$_nameInstrumentImage.png'),
      fit: BoxFit.cover,
      height: 40,
    ),
  );
}
Widget _buttonEmpty(int i, int j) {
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
      hide: false,
      
    ),
  );
}

