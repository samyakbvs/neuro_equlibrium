import 'package:flutter/material.dart';
import 'package:neuroequlibrium/welcome_screen.dart';
import 'package:neuroequlibrium/edit_details.dart';
import 'package:neuroequlibrium/additional_details.dart';
import 'package:neuroequlibrium/dashboard.dart';
import 'package:neuroequlibrium/user_profile.dart';
import 'package:neuroequlibrium/daily_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: 'welcome_screen',
        routes: {
          'welcome_screen': (context) => WelcomeScreen(),
          'edit_details': (context) => EditDetails(),
//          'additional_details1': (context) => AdditionalDetails1(),
          'dashboard': (context) => Dashboard(),
          'user_profile': (context) => UserProfile(),
          'daily_data': (context) => DailyData(),
//          'additional_details2': (context) => AdditionalDetails2(),
        });
  }
}
