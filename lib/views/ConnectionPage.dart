
import 'package:flutter/material.dart';
import 'package:redditech/views/MyAppBar.dart';
import 'package:redditech/views/pageLogin.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Login Page',),
      body: _ConnectionPageContent(),
    );
  }
}

class _ConnectionPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
              child: Image.asset('assets/images/reddit_logo.png')
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                side: BorderSide(style: BorderStyle.solid,color: Colors.orange,width: 3),
                primary: Colors.orange[800],
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageLogin(),
                  )
              );},
              child: Text('Login with Reddit')
          ),
          Expanded(
              child: Container()
          ),
        ],
      ),
    );
  }
}
