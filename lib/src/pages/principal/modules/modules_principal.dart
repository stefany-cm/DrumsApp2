import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/material.dart';

class ModulesPrincipal extends StatelessWidget {
  const ModulesPrincipal({Key key}) : super(key: key);

  get title => 'Módulo';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cardModules('Teoría', ExactAssetImage('assets/Teoria.png'), 2,'Items', context, "/listTeory"),
              cardModules('Ejercicios',ExactAssetImage('assets/Ejercicios.png'),3,'Niveles',context, "/listExercises"),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cardModules('Ritmos', ExactAssetImage('assets/Ritmos.png'), 2,'Items', context, "/listRhythms"),
              cardModules('Composición',ExactAssetImage('assets/Composicion.png'),3,'Niveles', context, "/listComposition"),
            ],
          )
        ],
      ),
    );
  }
}

Widget cardModules(String title, ExactAssetImage image, int num, String nameItem, BuildContext context, String route) {
  final size = MediaQuery.of(context).size;
  return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.08),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(1.0, 3.0))
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _textTitle(title),
              _imageIcon(image, size),
              _infoSubtitle(num, nameItem),
            ])
          ),
          onTap: (){
            Navigator.of(context).pushNamed('$route');
          },
  );
}

_infoSubtitle(int num, String nameItem) {
  return Container(
      margin: EdgeInsets.only(left: 35.0),
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text('$num', style: textStyleCard),
          SizedBox(width: 4.0),
          Text('$nameItem', style: textStyleSubtitleCard),
        ],
      ));
}

_imageIcon(ExactAssetImage image, Size size) {
  return Container(
    margin: EdgeInsets.only(left: 20.0),
    width: size.width * 0.27,
    height: size.height * 0.13,
    child: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(30.0),
            width: size.width * 0.3,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              color: Colors.grey[100],
            )),
        Container(
          width: size.width * 0.2,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: image,
            ),
          ),
        )
      ],
    ),
  );
}

_textTitle(String title) {
  return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(title, style: textStyleCard));
}
