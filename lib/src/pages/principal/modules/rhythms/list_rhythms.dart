import 'package:drumsapp2/src/controllers/rhythms_controller.dart';
import 'package:drumsapp2/src/pages/principal/modules/rhythms/view_rhythms.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/cards.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ListRhythms extends StatefulWidget {
  const ListRhythms({Key key}) : super(key: key);

  @override
  _ListRhythmsState createState() => _ListRhythmsState();
}

class _ListRhythmsState extends State<ListRhythms> {
  // static const rhythms = {
  //   "Balada": [
  //     [1, 1, 1, 1, 1, 1, 1, 1],
  //     [0, 0, 1, 0, 0, 0, 1, 0],
  //     [1, 0, 0, 0, 1, 0, 0, 0]
  //   ],
  //   "Reggaetón": [
  //     [1, 0, 1, 0, 1, 0, 1, 0],
  //     [0, 1, 0, 1, 0, 1, 0, 1],
  //     [1, 0, 1, 0, 1, 0, 1, 0]
  //   ],
  //   "SKA": [
  //     [0, 1, 0, 1, 0, 1, 0, 1],
  //     [0, 0, 1, 0, 0, 0, 1, 0],
  //     [1, 0, 0, 0, 1, 0, 0, 0]
  //   ],
  //   "Balada pop rock": [
  //     [1, 1, 1, 1, 1, 1, 1, 1],
  //     [0, 0, 1, 0, 0, 0, 1, 1],
  //     [1, 0, 0, 1, 1, 0, 0, 0]
  //   ],
  //   "Vals": [
  //     [1, 0, 1, 0, 1, 0],
  //     [0, 0, 1, 0, 1, 0],
  //     [1, 0, 0, 0, 0, 0]
  //   ]
  // };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RhythmsController>(
        init: RhythmsController(),
        builder: (_) => Scaffold(
            appBar: linearAppBar('Ritmos', orangeColor, context),
            body: listCard(context)));
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            new CircleAvatar(
              child: Text(name[0]),
            ),
            Padding(padding: EdgeInsets.only(right: 10.0)),
            Text(
              name,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
