import 'package:drumsapp2/src/controllers/rhythms_controller.dart';
import 'package:drumsapp2/src/models/RespRhythm.dart';
import 'package:drumsapp2/src/pages/principal/modules/rhythms/view_rhythms.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

Widget basicCard(String title, IconData icon, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[200],
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(-2, 3.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: purple2Color),
              SizedBox(width: size.width * 0.04),
              Text(title, style: textStyleSubtitleCard),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[300],
          )
        ],
      ),
    ),
    onTap: () {},
  );
}

Widget listCardV1(
    String title, String imageR, BuildContext context, ViewRhythms route) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[200],
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(-2, 3.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Image.asset(imageR),
                width: size.width * 0.12,
              ),
              SizedBox(width: size.width * 0.04),
              Text(title, style: textStyleSubtitleCard),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[300],
          )
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => route,
          ));
    },
  );
}

Widget listCard(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return GetBuilder<RhythmsController>(
      id: 'listRhythms',
      // init: TheoryController(),
      builder: (_) => ListView.builder(
            itemBuilder: (context, index) {
              final RespRhythm resp = _.listResp[index];
              return InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.width * 0.04),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                            offset: Offset(-2, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Image.asset('assets/icons/RitmosList.png'),
                            width: size.width * 0.12,
                          ),
                          SizedBox(width: size.width * 0.04),
                          Text(resp.name, style: textStyleSubtitleCard),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[300],
                      )
                    ],
                  ),
                ),
                onTap: () => _.showMatrizRhythms(resp),
              );
            },
            itemCount: _.listResp.length,
          ));
}

Widget groupCard(
    String title, String date, int numStudents, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[200],
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(-2, 3.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          iconLetters(title),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Column(
              children: <Widget>[
                Text(title, style: textStyleSubtitleCard),
                SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Icon(Icons.date_range, color: Colors.grey[500], size: 18),
                    SizedBox(width: 4),
                    Text(date, style: textStyleSubtitleCardShort),
                    SizedBox(width: 4),
                    Icon(Icons.person, color: Colors.grey[500], size: 18),
                    SizedBox(width: 4),
                    Text(numStudents.toString(),
                        style: textStyleSubtitleCardShort),
                  ],
                )
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[300])
        ],
      ),
    ),
    onTap: () {},
  );
}

Widget iconLetters(String title) {
  return Container(
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Colors.grey[200],
      ),
      child: Text(
        _letters(title),
        textScaleFactor: 2,
        style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

String _letters(String title) {
  List<String> words = title.split(" ");
  var letters = StringBuffer();

  words.forEach((item) {
    letters.write(item.substring(0, 1).toUpperCase());
  });

  return letters.toString();
}
