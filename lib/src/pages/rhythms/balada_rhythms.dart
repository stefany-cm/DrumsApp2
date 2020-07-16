import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaladaRhythms extends StatefulWidget {
  BaladaRhythms({Key key}) : super(key: key);

  @override
  _BaladaRhythmsState createState() => _BaladaRhythmsState();
}

class _BaladaRhythmsState extends State<BaladaRhythms> {
  bool state = true;
  double rating = 0.0;

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
        preferredSize: Size.fromHeight(35.0),
        child: linearAppBar('Balada', orangeColor, context)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    buttonSet(),
                    switchMetronome(state, _changeSwitchMetronome),
                    speedSlider(rating, _changeSpeedSlider)
                  ],
                ),
                instrumentMatrix()
              ],
            ),
            pseudoSheetMusic()
          ],
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
    Text('Velocidad', style: textStyleSubtitleCardShort,),
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

Widget instrumentMatrix() {
  return Container();
}

Widget pseudoSheetMusic() {
  return Container();
}
