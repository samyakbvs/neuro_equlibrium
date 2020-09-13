import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditDetails extends StatefulWidget {
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
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
        title: Text('Edit your profile'),
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
                TextLabel('Name'),
                TextField(
                  onChanged: (value) {
                    user_name = value;
                  },
                  decoration: kInputStyle.copyWith(
                    hintText: user_name,
                  ),
                ),
                SizedBox(height: 25.0),
                TextLabel('Date of birth'),
                TextField(
                  onChanged: (value) {
                    user_dob = value;
                  },
                  decoration: kInputStyle.copyWith(
                    hintText: user_dob,
                  ),
                ),
                SizedBox(height: 25.0),
                TextLabel('Sex'),
                TextField(
                  onChanged: (value) {
                    user_gender = value;
                  },
                  decoration: kInputStyle.copyWith(
                    hintText: user_gender,
                  ),
                ),
                SizedBox(height: 25.0),
//                TextLabel('Phone No.'),
//                TextField(
//                  onChanged: (value) {},
//                  decoration:
//                      kInputStyle.copyWith(hintText: loggedInUser.phoneNumber),
//                ),
                SizedBox(height: 30.0),
                RoundedButton(
                  color: Colors.blueAccent,
                  text: 'Submit',
                  onPressed: () async {
                    // Update Details & Redirect user
                    final doc = _firestore
                        .collection('userProfiles')
                        .document(loggedInUser.uid);
                    doc.updateData({
                      'FullName': user_name,
                      'Dob': user_dob,
                      'Sex': user_gender,
                    });
                    Navigator.pushNamed(context, 'dashboard');
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
