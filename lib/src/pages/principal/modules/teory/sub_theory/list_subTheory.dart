import 'package:drumsapp2/src/controllers/subTheory_controller.dart';
import 'package:drumsapp2/src/pages/principal/modules/teory/sub_theory/view_subTheory.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SubTheory extends StatelessWidget {
  final String nameTheory;
  const SubTheory({Key key, this.nameTheory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubTheoryController>(
      init: SubTheoryController(),
      builder: (_) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar:
              linearAppBarActions(nameTheory, pinkColor, context, _actions()),
          backgroundColor: Colors.white,
          body: ViewSubTheory()),
    );
  }

  List<Widget> _actions() {
    List<Widget> resp = new List();

    resp.add(IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          print("ingrese al alert******");
          AlertDialog(
            title: Text("My title"),
            content: Text("This is my message."),
          );
        }));
    return resp;
  }

  /*Widget _cardSwiper(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return GetBuilder<SubTheoryController>(
      id: 'listsubTheory',
      init: SubTheoryController(),
      builder: (_) => Swiper(
        layout: SwiperLayout.DEFAULT,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          final Subtheory resp = _.subtheorys[index];

          return Hero(
            tag: resp.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: <Widget>[
                  VideoUtil(),
                  Center(
                      child: new Text(
                    resp.name,
                    style: textStyleBoldBlack,
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Center(
                      child: new RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: resp.description)
                              ])),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _.subtheorys.length,
      ),
    );
  }*/

  /*Widget _theoryForm(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return GetBuilder<SubTheoryController>(
      // id: 'Theory',
      init: SubTheoryController(),
      builder: (_) => Text(_.theory1.name),
    );
  }*/

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

  /*Widget _listTheoryForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<SubTheoryController>(
        id: 'listsubTheory',
        init: SubTheoryController(),
        builder: (_) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Subtheory resp = _.subtheorys[index];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 200,
                      child: Column(
                        children: <Widget>[
                          VideoUtil(),
                          Center(
                              child: new Text(
                            resp.name,
                            style: textStyleBoldBlack,
                          )),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            child: Center(
                              child: new RichText(
                                  textAlign: TextAlign.center,
                                  text: new TextSpan(
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: resp.description)
                                      ])),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: resp.id == 1
                                ? Container(
                                    width: 36,
                                    height: 20,
                                  )
                                : IconButton(
                                    icon: Icon(Icons.navigate_before),
                                    iconSize: 20,
                                    color: pinkColor,
                                    onPressed: () {}),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: 50,
                                  child: Dots(resp.id, _.subtheorys.length)),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: resp.id == _.subtheorys.length
                                ? IconButton(
                                    icon: Icon(Icons.check),
                                    iconSize: 20,
                                    color: pinkColor,
                                    onPressed: () {})
                                : IconButton(
                                    icon: Icon(Icons.navigate_next),
                                    iconSize: 20,
                                    color: pinkColor,
                                    onPressed: () {}),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: _.subtheorys.length,
            ));
  }
}

class Dots extends StatefulWidget {
  int index, items;
  Dots(this.index, this.items);
  @override
  _DotsState createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("deneme" + currentPage.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.items,
      itemBuilder: (context, int index) {
        index = index + 1;
        return Container(
            margin: EdgeInsets.only(right: index % 2 != 0 ? 4 : 0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == widget.index ? pinkColor : Colors.white,
                border: Border.all(color: pinkColor)));
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 16,
              left: 12,
              child: Text(
                "LET'S GO!",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }*/
}
