import 'package:flutter/material.dart';
import 'package:neuroequlibrium/reusable.dart';

class AdditionalDetails1 extends StatefulWidget {
  @override
  _AdditionalDetails1State createState() => _AdditionalDetails1State();
}

class _AdditionalDetails1State extends State<AdditionalDetails1> {
  int height = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addition Details'),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Samyak, we won\'t take much of your time. Just answer some basic questions and you\'re done!'),
                ),
                SizedBox(height: 100.0),
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
                      height.toString(),
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
                    value: height.toDouble(),
                    min: 0.0,
                    max: 20.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RoundedButton(
                  color: Colors.blueAccent,
                  text: 'Proceed',
                  onPressed: () {
                    // Upload details & Redirect user
                    Navigator.pushNamed(context, 'additional_details2');
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

class AdditionalDetails2 extends StatefulWidget {
  @override
  _AdditionalDetails2State createState() => _AdditionalDetails2State();
}

class _AdditionalDetails2State extends State<AdditionalDetails2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addition Details'),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('DEMO TEXT'),
                ),
                SizedBox(height: 100.0),
//                Text(
//                  'How often did you experience a migraine attack in the last 30 days?',
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    fontSize: 18.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                RoundedButton(
//                  color: Colors.blueAccent,
//                  text: 'Proceed',
//                  onPressed: () {
//                    // Upload details & Redirect user
//                  },
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
