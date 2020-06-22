import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('images/neurologo.png'),
              height: 180.0,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'App name',
                style: TextStyle(
                  fontSize: 36.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
