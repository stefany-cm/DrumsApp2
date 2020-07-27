import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:flutter/material.dart';

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