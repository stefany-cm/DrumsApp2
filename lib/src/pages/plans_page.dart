import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  PlansPage({Key key}) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  bool _termsChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: CheckboxListTile(
        activeColor: Theme.of(context).accentColor,
        title: Text('I agree to'),
        value: _termsChecked,
        onChanged: (bool value) => setState(() => _termsChecked = value),
        subtitle: !_termsChecked
            ? Padding(
                padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                child: Text(
                  'Required field',
                  style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                ),
              )
            : null,
      )),
    );
  }
}
