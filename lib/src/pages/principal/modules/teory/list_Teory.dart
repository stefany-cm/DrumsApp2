import 'package:drumsapp2/src/controllers/theory_controller.dart';
import 'package:drumsapp2/src/models/RespTheoryAndSub.dart';
import 'package:drumsapp2/src/models/Theory.dart';

import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';

import 'package:get/get.dart';

import 'package:drumsapp2/src/widgets/customAppBar.dart';

import 'package:flutter/material.dart';

class PagerTheory extends StatelessWidget {
  const PagerTheory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TheoryController>(
      init: TheoryController(),
      builder: (_) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: linearAppBarTheory('Teoría', pinkColor, context),
          backgroundColor: Colors.white,
          body: _listTheoryForm(context)),
    );
  }
}

// Widget _listTheoryForm2() {
//   return GetBuilder<TheoryController>(
//       id: 'listTheory',
//       // init: TheoryController(),
//       builder: (_) => ListView.builder(
//             itemBuilder: (context, index) {
//               final RespTheoryAndSub resp = _.listResp[index];
//               return ListTile(
//                 title: Text(resp.name),
//                 subtitle: Text(resp.description),
//                 onTap: () => {},
//               );
//             },
//             itemCount: _.listResp.length,
//           ));
// }

Widget _listTheoryForm(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return GetBuilder<TheoryController>(
      id: 'listTheory',
      init: TheoryController(),
      builder: (_) => ListView.builder(
            itemBuilder: (context, index) {
              final Theory resp = _.listResp[index];
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
                            child: Image.asset('assets/icons/TeoriaList.png'),
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
                onTap: () => _.showSubTheory(resp, _.listResp.length),
              );
            },
            itemCount: _.listResp.length,
          ));
}

// Widget listCardTheory(String title, String imageR, BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   return InkWell(
//     child: Container(
//       margin: EdgeInsets.only(top: 15.0),
//       padding: EdgeInsets.symmetric(
//           horizontal: size.width * 0.05, vertical: size.width * 0.04),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18.0),
//           color: Colors.white,
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.grey[200],
//                 blurRadius: 8.0,
//                 spreadRadius: 1.0,
//                 offset: Offset(-2, 3.0))
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Container(
//                 child: Image.asset(imageR),
//                 width: size.width * 0.12,
//               ),
//               SizedBox(width: size.width * 0.04),
//               Text(title, style: textStyleSubtitleCard),
//             ],
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.grey[300],
//           )
//         ],
//       ),
//     ),
//     onTap: () {},
//   );
// }
