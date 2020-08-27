import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/cards.dart';
import 'package:flutter/material.dart';

class GroupPrincipal extends StatelessWidget {
  const GroupPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Matriculados', style: textStyleCardTitle),
          groupCard('Grupo universidad', '06-06-2019', 28, context),
          basicCard('Personal', Icons.person, context),
          basicCard('Matricular grupo', Icons.add, context),
          SizedBox(height: 18.0,),
          Text('Creados', style: textStyleCardTitle),
          basicCard('Crear grupo', Icons.group_add, context),
        ],
      ),
    );
  }
}

