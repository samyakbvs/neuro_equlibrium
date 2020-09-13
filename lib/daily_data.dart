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
  int sleep = 8;
  int exercise = 2;
  int sun = 1;

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
        title: Text('Add daily data'),
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
                Text(
                  'How often did you experience a migraine attack in the last 30 days?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      sleep.toString(),
                      style: NumberTextStyle,
                    ),
//                    Text(
//                      'cm',
//                      style: LabelTextStyle,
//                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: sleep.toDouble(),
                    min: 0.0,
                    max: 20.0,
                    onChanged: (double newValue) {
                      setState(() {
                        sleep = newValue.round();
                      });
                    },
                  ),
                ),
                Text(
                  'How often did you experience a migraine attack in the last 30 days?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      exercise.toString(),
                      style: NumberTextStyle,
                    ),
//                    Text(
//                      'cm',
//                      style: LabelTextStyle,
//                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: exercise.toDouble(),
                    min: 0.0,
                    max: 20.0,
                    onChanged: (double newValue) {
                      setState(() {
                        exercise = newValue.round();
                      });
                    },
                  ),
                ),
                Text(
                  'How often did you experience a migraine attack in the last 30 days?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      sun.toString(),
                      style: NumberTextStyle,
                    ),
//                    Text(
//                      'cm',
//                      style: LabelTextStyle,
//                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: sun.toDouble(),
                    min: 0.0,
                    max: 20.0,
                    onChanged: (double newValue) {
                      setState(() {
                        sun = newValue.round();
                      });
                    },
                  ),
                ),
                RoundedButton(
                  color: Colors.blueAccent,
                  text: 'Submit',
                  onPressed: () async {
                    await _firestore
                        .collection("dataDaily")
                        .document(loggedInUser.uid)
                        .setData({
                      'sleep': sleep,
                      'exercise': exercise,
                      'sun': sun,
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
