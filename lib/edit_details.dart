import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';

class EditDetails extends StatefulWidget {
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  void method() {}

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
                TextLabel('Name'),
                TextField(
                  onChanged: (value) {},
                  decoration: kInputStyle.copyWith(
                    hintText: 'Samyak',
                  ),
                ),
                SizedBox(height: 25.0),
                TextLabel('Date of birth'),
                TextField(
                  onChanged: (value) {},
                  decoration: kInputStyle.copyWith(hintText: '5/10/2003'),
                ),
                SizedBox(height: 25.0),
                TextLabel('Sex'),
                TextField(
                  onChanged: (value) {},
                  decoration: kInputStyle.copyWith(hintText: 'Male'),
                ),
                SizedBox(height: 25.0),
                TextLabel('Phone No.'),
                TextField(
                  onChanged: (value) {},
                  decoration: kInputStyle.copyWith(hintText: '9549348098'),
                ),
                SizedBox(height: 30.0),
                RoundedButton(
                  color: Colors.blueAccent,
                  text: 'Verify',
                  onPressed: () {
                    // Update Details & Redirect user
                    Navigator.pushNamed(context, 'additional_details1');
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
