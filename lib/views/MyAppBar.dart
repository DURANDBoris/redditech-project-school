import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  String title;

  MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange[700],
      title: Center(
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/images/Reddit-icon.png'),
            ),
            SizedBox(
              width: 30,
            ),
            Text('$title'),
          ],
        )
      ),
    );
  }
}
