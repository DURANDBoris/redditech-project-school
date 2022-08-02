

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditech/provider/ProfileProvider.dart';
import 'package:redditech/provider/SubsProvider.dart';
import 'package:redditech/views/ConnectionPage.dart';

void main() {
  runApp(
    const MyApp())
    ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SubsProvider()),
        ],
      child: MaterialApp(
        title: 'Redditech',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: ConnectionPage(),
      ),
    );
  }
}