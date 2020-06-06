import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => new _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  void initState() {
    super.initState();
  }

  _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('slogin', false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: new Container(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Akun'),
                  RaisedButton(
                    onPressed: () => _logOut(),
                    color: Colors.white,
                    child: const Text('Logout', style: TextStyle(fontSize: 18)),
                  )
                ]),
          )),
    ));
  }
}
