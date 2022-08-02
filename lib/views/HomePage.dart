import 'package:flutter/material.dart';
import 'package:redditech/views/MyAppBar.dart';
import 'package:redditech/views/MyDrawer.dart';
import 'package:redditech/data/userData.dart' as userData;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(userData.accessToken);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(title: 'Home Page',),
      body: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[700],
    );
  }
}
