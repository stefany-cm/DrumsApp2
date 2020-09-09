import 'package:drumsapp2/src/controllers/subTheory_controller.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/utils/video_util.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ViewSubTheory extends StatefulWidget {


  @override
  ViewSubTheoryState createState() => ViewSubTheoryState();
}

class ViewSubTheoryState extends State<ViewSubTheory> {
  
  CarouselSlider carouselSlider;
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubTheoryController>(
        init: SubTheoryController(),
        id: 'listsubTheory',
        builder: (_) {
          if (_.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                carouselSlider = CarouselSlider(
                  height: MediaQuery.of(context).size.height - 200,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 40),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 15),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: _.subtheorys.map((resp) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.grey[100].withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 1),
                              VideoUtil(resp.url),
                              SizedBox(height: 15),
                              Center(
                                  child: new Text(
                                  resp.name,
                                  style: textStyleTitle,
                                )
                              ),
                              SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Center(
                                    child: new RichText(
                                        textAlign: TextAlign.center,
                                        text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                  text: resp.description,
                                                  style: textStyleDescription)
                                            ])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.navigate_before),
                        iconSize: 20,
                        color: Colors.grey[400],
                        onPressed: goToPrevious),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(_.subtheorys, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Colors.redAccent
                                : Colors.grey[100],
                          ),
                        );
                      }),
                    ),
                    IconButton(
                        icon: Icon(Icons.navigate_next),
                        iconSize: 20,
                        color: Colors.grey[400],
                        onPressed: goToNext),
                  ],
                ),
              ],
            ));
          }
        });
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
