import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';

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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/neurologo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 25.0),
              Text(
                  'Hi there! Welcome to NeuroEquilibrium\'s Migraine App. Let\'s get started to solve all your migraine woes. Enter your Neuro patient ID to get started!'),
              SizedBox(height: 25.0),
              TextField(
                decoration: kInputStyle.copyWith(hintText: 'UID'),
              ),
              SizedBox(height: 25.0),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
