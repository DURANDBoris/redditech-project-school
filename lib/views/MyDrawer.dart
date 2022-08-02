import 'package:flutter/material.dart';
import 'package:redditech/views/HomePage.dart';
import 'package:redditech/views/ProfilePage.dart';
import 'package:redditech/views/SubPage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                'Redditech',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
              title: Text('Home Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }
          ),
          ListTile(
              title: Text('Profile Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              }
          ),
          ListTile(
              title: Text('Subs Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubPage(),
                    ));
              }
          ),
        ],
      ),
    );
  }
}


