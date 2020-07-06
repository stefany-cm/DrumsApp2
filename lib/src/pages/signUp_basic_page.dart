import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
// import 'package:drumsapp2/src/widgets/inputs.dart';
import 'package:drumsapp2/src/widgets/inputsSignUpBasic.dart';

import 'package:flutter/material.dart';

class SignUpBasicPage extends StatelessWidget {
  const SignUpBasicPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          customAppBar('Colocar foto', context),
          _singUpForm(context)
        ],
      ),
    );
  }

  Widget _singUpForm(BuildContext context) {
    final bloc = Provider.ofS(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      SafeArea(
        child: Container(
          height: 80.0,
        ),
      ),
      Container(
        width: size.width,
        margin: EdgeInsets.only(top: size.height * 0.23),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            nameInput(bloc),
            SizedBox(height: 20.0),
            datePruebaInput(bloc),
            SizedBox(height: 20.0),
            // dateInput(bloc),
            // SizedBox(height: 30.0),
            genreInput(bloc),
            SizedBox(height: 20.0),

            createCustomRaisedButton(bloc, 'Finalizar'),
            SizedBox(height: 45.0),
          ],
        ),
      ),
    ]));
  }
}
