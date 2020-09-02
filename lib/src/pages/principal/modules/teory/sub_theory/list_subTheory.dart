import 'package:drumsapp2/src/controllers/subTheory_controller.dart';
import 'package:drumsapp2/src/models/RespSub.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/state_manager.dart';

class SubTheory extends StatelessWidget {
  const SubTheory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubTheoryController>(
      init: SubTheoryController(),
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: linearAppBar('Teoría', pinkColor, context),
        backgroundColor: Colors.white,
        body: _listTheoryForm(context),
      ),
    );
  }

  Widget _theoryForm(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return GetBuilder<SubTheoryController>(
      // id: 'Theory',
      init: SubTheoryController(),
      builder: (_) => Text(_.theory1.name),
    );
  }

  // child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text('Matriculados', style: textStyleCardTitle),
  //         groupCard('Grupo universidad', '06-06-2019', 28, context),
  //         basicCard('Personal', Icons.person, context),
  //         basicCard('Matricular grupo', Icons.add, context),
  //         SizedBox(height: 18.0,),
  //         Text('Creados', style: textStyleCardTitle),
  //         basicCard('Crear grupo', Icons.group_add, context),
  //       ],
  //     ),

  Widget _listTheoryForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<SubTheoryController>(
        id: 'listsubTheory',
        init: SubTheoryController(),
        builder: (_) => ListView.builder(
              itemBuilder: (context, index) {
                final Subtheory resp = _.subtheorys[index];
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
                  onTap: () {},
                );
              },
              itemCount: _.subtheorys.length,
            ));
  }
}
