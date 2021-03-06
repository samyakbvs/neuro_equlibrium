import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
        title: Text('Profile'),
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
                Text("Name: $user_name"),
                Text("DOB: $user_dob"),
                Text("Sex: $user_gender"),
                RoundedButton(
                  color: Colors.blueAccent,
                  text: 'Edit',
                  onPressed: () {
                    // Upload details & Redirect user
                    Navigator.pushNamed(context, 'edit_details');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
