import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/models/theory.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:animate_do/animate_do.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';

import 'package:flutter/material.dart';

// Future<List<Theory>> getTheory() async {
//   final String _url = "http://192.168.1.19:3000";
//   print('entrando  getTeoria ' + _url);

//   final res = await http.get('$_url/partitura/getTheory');

//   print(theoryFromJson(res.body));
//   return theoryFromJson(res.body);
// }

PartitureProvider _consul = new PartitureProvider();

class PagerTheory extends StatelessWidget {
  const PagerTheory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: linearAppBar('Teoría', pinkColor, context),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _consul.getTheory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.connectionState);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // return _ListaTheorys(snapshot.data);
            return _listTheoryForm(context, snapshot.data);
          }
        },
      ),
    );
  }
}

Widget _listTheoryForm(BuildContext context, dynamic data) {
  final List<Theory> theorys = data;
  // Provider bloc = new Provider();
  // final bloc = Provider.ofT(context);
  return ListView.builder(
    itemCount: theorys.length,
    itemBuilder: (BuildContext context, int i) {
      final theory = theorys[i];

      return listTile(theory.name, theory.description, theory.id, i,
          "/list_subTheory", data);

      //     BounceInUp(
      //   delay: Duration(milliseconds: 100 * i),
      //   child: ListTile(
      //     title: Text('${theory.name}'),
      //     subtitle: Text(theory.description),

      //     onTap: () => theory.id = 60,

      //   ),
      // );
    },
  );
}

Widget listTile(
    String name, String description, int id, int i, route, dynamic data) {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        child: BounceInUp(
          delay: Duration(milliseconds: 100 * i),
          child: ListTile(
            title: Text(name),
            subtitle: Text(description),

            // onLongPress: data ? () => _consulSub(bloc, context) : null,

            onTap: () => Navigator.of(context).pushNamed('$route'),

            // onLongPress: (value = id) => ,
            // onChanged: (value) => bloc.changeMail(value),
          ),
        ),

        // padding: EdgeInsets.symmetric(horizontal: 20.0),
        // child: TextField(
        //   keyboardType: TextInputType.emailAddress,
        //   decoration: InputDecoration(
        //       icon: Icon(Icons.alternate_email),
        //       labelText: 'Correo electrónico',
        //       hintText: 'ejemplo@correo.com',
        //       counterText: snapshot.data,
        //       errorText: snapshot.error),
        //   onChanged: (value) => bloc.changeMail(value),
        // ),
      );
    },
  );
}

_consulSub(dynamic bloc, BuildContext context) async {
  final servLogin = new PartitureProvider();
  // final servLogin = new Servicion();

  Future<List<Theory>> rest =
      await servLogin.getSubTheory(bloc.theoriaID, context);

  // servLogin.createUser();

  print('============');

  print('Respuesta de consulta: ${rest}');
}

class PagersubTheory extends StatelessWidget {
  const PagersubTheory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Theory"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        // future: _consul.getSubTheory(id, context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.connectionState);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // return _ListaTheorys(snapshot.data);
            return _listTheoryForm(context, snapshot.data);
          }
        },
      ),
    );
  }
}
