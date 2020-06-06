import 'package:flutter/material.dart';
import './beranda.dart';
import './produk.dart';
import './akun.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [new Beranda(), new Produk(), new Akun()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_bottomNavCurrentIndex],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.message), title: Text('Pesan Masuk')),
              ListTile(
                  leading: Icon(Icons.account_circle), title: Text('Profil')),
              ListTile(
                  leading: Icon(Icons.settings), title: Text('Pengaturan')),
            ],
          ),
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: new Text('Beranda',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.red
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.assignment,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.assignment,
                color: Colors.grey,
              ),
              title: new Text('Produk',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 1
                          ? Colors.red
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.people,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.people,
                color: Colors.grey,
              ),
              title: new Text('Akun',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 2
                          ? Colors.red
                          : Colors.grey)),
            ),
          ],
        ));
  }
}
