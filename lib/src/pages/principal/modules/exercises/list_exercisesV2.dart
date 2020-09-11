import 'package:drumsapp2/src/controllers/exercises_controller.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/cards.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class ListExercises2 extends StatefulWidget {
  const ListExercises2({Key key}) : super(key: key);

  @override
  _ListExercises2State createState() => _ListExercises2State();
}

class _ListExercises2State extends State<ListExercises2> {
  // List<String> rhythms = [
  //   'Balada',
  //   'Reggaetón',
  //   'SKA',
  //   'Balada pop rock',
  //   'Vals'
  // ];

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return GetBuilder<ExercisesController>(
        init: ExercisesController(),
        builder: (_) => Scaffold(
            appBar: linearAppBarListExercises('Ejercicios', greenColor, context),
            body: listCardExercisesv2(context)));
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
