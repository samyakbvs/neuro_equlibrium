import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyData extends StatefulWidget {
  @override
  _DailyDataState createState() => _DailyDataState();
}

class _DailyDataState extends State<DailyData> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String user_name;
  String user_gender;
  String user_dob;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
//    try {
    if (user != null) {
      final snapShot =
          await _firestore.collection('userProfiles').document(user.uid).get();

      print("****SUCCESS****");
      print(snapShot);

      setState(() {
        loggedInUser = user;
        user_name = snapShot.data['FullName'];
        user_gender = snapShot.data['Sex'];
        user_dob = snapShot.data['Dob'];
      });
    }
//    }
//    catch (e) {
//      print("****Error****");
//      print(e);
//      print("****Error****");
//    }
  }

  void initState() {
    // TODO: implement initState

    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your details'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 50.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Upload data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
