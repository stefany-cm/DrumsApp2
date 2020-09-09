import 'package:drumsapp2/src/pages/principal/modules/exercises/view_exercises.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/cards.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class ListLevelsExercises extends StatefulWidget {
  const ListLevelsExercises({Key key}) : super(key: key);

  @override
  _ListLevelsExercisesState createState() => _ListLevelsExercisesState();
}

class _ListLevelsExercisesState extends State<ListLevelsExercises> {
  static const listLevelsExercises = {
    "Básico":{
      1:[
        [1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 0]
     ],
     2:[
        [1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 0]
     ],
     3:[
        [1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 0]
     ]
    },
    "Medio":{
      1:[
        [1, 0, 1, 0, 1, 0, 1, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 1, 0]
      ],
      2:[
        [1, 0, 1, 0, 1, 0, 1, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 1, 0]
      ],
    },
    "Avanzado":{
      1:[
        [1, 0, 1, 1, 1, 0, 1, 0],
        [0, 1, 1, 0, 1, 0, 0, 1],
        [1, 0, 0, 1, 0, 1, 1, 0]
      ],
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: linearAppBar('Ejercicios', greenColor, context),
      body: ListView(
            reverse: false,
            children: listLevelsExercises.entries.map((entry) {
              return listCardExercises(entry.key, 'assets/icons/EjerciciosList.png', context,
                  (ViewExercises(matrix: entry.value, level: entry.key)));
            }).toList()));
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(
              child: new Text(name[0]),
            ),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(
              name,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
