import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/material.dart';

class GroupPrincipal extends StatelessWidget {
  const GroupPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text('Matriculados', style: textStyleCardTitle),
          
        ],
      ),
    );
  }
}