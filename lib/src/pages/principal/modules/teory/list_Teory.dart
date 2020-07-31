import 'package:drumsapp2/src/pages/principal/modules/rhythms/view_rhythms.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/cards.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class ListTeory extends StatefulWidget {
  const ListTeory({Key key}) : super(key: key);

  @override
  _ListRhythmsState createState() => _ListRhythmsState();
}

class _ListRhythmsState extends State<ListTeory> {
   List rhythms = [
    {"name": "Balada", "matrix":[[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]]},
    {"name": "Reggaetón", "matrix":[[1, 0, 1, 0, 1, 0, 1, 0], [0, 1, 0, 1, 0, 1, 0, 1], [1, 0, 1, 0, 1, 0, 1, 0]]},
    {"name": "SKA", "matrix":[[0, 1, 0, 1, 0, 1, 0, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]]},
    {"name": "Balada pop rock", "matrix":[[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 1], [1, 0, 0, 1, 1, 0, 0, 0]]},
    {"name": "Vals", "matrix":[[1, 0, 1, 0, 1, 0], [0, 0, 1, 0, 1, 0], [1, 0, 0, 0, 0, 0]]}
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: linearAppBar('Teoría', pinkColor, context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
        child: ListView(
          reverse: false,
          children: rhythms.map((e){
              listCard(e, 'assets/RitmosList.png', context, (ViewRhythms(matrix: e, nameRhythms: e))); 
            }).toList()
        ),
      ),
    );
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
