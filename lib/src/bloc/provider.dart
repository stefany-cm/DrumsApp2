import 'package:drumsapp2/src/bloc/login_bloc.dart';
import 'package:drumsapp2/src/bloc/signUp_bloc.dart';
export 'package:drumsapp2/src/bloc/login_bloc.dart';

import 'package:flutter/material.dart';

class Provider extends InheritedWidget{

  final loginBloc = LoginBloc();
  final signUpBloC = SignUpBloc();

  Provider ({Key key, Widget child})
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc ofL(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
  static SignUpBloc ofS(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).signUpBloC;
  }

}