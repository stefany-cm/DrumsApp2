import 'package:drumsapp2/src/controllers/homeNavigationPrincipal_controller.dart';

import 'package:drumsapp2/src/pages/principal/groups/group_principal.dart';
import 'package:drumsapp2/src/pages/principal/modules/modules_principal.dart';
import 'package:drumsapp2/src/widgets/gradientAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

import '../../utils/colors_utils.dart';

class HomeNavigationPrincipal extends StatefulWidget {
  const HomeNavigationPrincipal({Key key}) : super(key: key);

  @override
  _HomeNavigationPrincipalState createState() =>
      _HomeNavigationPrincipalState();
}

class _HomeNavigationPrincipalState extends State<HomeNavigationPrincipal> {
  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [
    ModulesPrincipal(),
    GroupPrincipal(),
    Center(child: Text('Logros')),
    Center(child: Text('Ajustes')),
  ];

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitDown,
                DeviceOrientation.portraitUp,
              ]);
    _title = 'Módulos';
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitDown,
                DeviceOrientation.portraitUp,
              ]);
    return GetBuilder<HomeNavigationPrincipalController>(
        init: HomeNavigationPrincipalController(),
        builder: (_) => Scaffold(
              appBar: gradientAppBarPrincipal(_title, purpleLinearGColor, context),
              body: _children[_currentIndex],
              bottomNavigationBar: _customBottomNavigationBar(),
            ));
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedItemColor: purple1Color,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('Módulos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Grupos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Logros'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Ajustes'),
          ),
        ],
        onTap: onTabTapped);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Módulos';
          }
          break;
        case 1:
          {
            _title = 'Grupos';
          }
          break;
        case 2:
          {
            _title = 'Logros';
          }
          break;
        case 3:
          {
            _title = 'Ajustes';
          }
          break;
      }
    });
  }
}
