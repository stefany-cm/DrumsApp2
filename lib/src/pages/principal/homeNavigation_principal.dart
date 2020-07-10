import 'package:drumsapp2/src/pages/principal/modules_principal.dart';
import 'package:drumsapp2/src/widgets/gradientAppBar.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_utils.dart';

class HomeNavigationPrincipal extends StatefulWidget {
  const HomeNavigationPrincipal({Key key}) : super(key: key);

  @override
  _HomeNavigationPrincipalState createState() => _HomeNavigationPrincipalState();
}

class _HomeNavigationPrincipalState extends State<HomeNavigationPrincipal> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ModulesPrincipal(),
    Center(child: Text('Grupos')),
    Center(child: Text('Logros')),
    Center(child: Text('Ajustes')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Módulos', purpleLinearGColor, context),
      body: _children[_currentIndex],
      bottomNavigationBar: _customBottomNavigationBar(),
    );
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
    onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
  );
}
}


