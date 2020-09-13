import 'package:flutter/material.dart';
import 'package:neuroequlibrium/edit_details.dart';
import 'package:neuroequlibrium/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var firebaseAuth;
  void instance() async {
    firebaseAuth = await FirebaseAuth.instance;
  }

//  FirebaseUser user;
  final _auth = FirebaseAuth.instance;

  String uid;
  String phone = '+1 6505553434';
  String smsCode = '123456';
  String actualCode;
  String status;
  AuthCredential _authCredential;

  void onAuthenticationSuccessful(BuildContext context) {
    Navigator.pushNamed(context, 'dashboard');
  }

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
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (value) {
                        phone = '+91 $value';
                      },
                      decoration: kInputStyle.copyWith(hintText: 'Phone No.'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RoundedButton(
                      color: Colors.blueAccent,
                      text: 'Send OTP',
                      onPressed: () async {
                        instance();
                        final PhoneCodeSent codeSent = (String verificationId,
                            [int forceResendingToken]) async {
                          this.actualCode = verificationId;
                          setState(() {
                            print('Code sent to $phone');
                            status =
                                "\nEnter the code sent to " + phone.toString();
                          });
                        };

                        final PhoneCodeAutoRetrievalTimeout
                            codeAutoRetrievalTimeout = (String verificationId) {
                          this.actualCode = verificationId;
                          setState(() {
                            status = "\nAuto retrieval time out";
                          });
                        };

                        final PhoneVerificationFailed verificationFailed =
                            (AuthException authException) {
                          setState(() {
                            status = '${authException.message}';

                            print("Error message: " + status);
                            if (authException.message
                                .contains('not authorized'))
                              status =
                                  'Something has gone wrong, please try later';
                            else if (authException.message.contains('Network'))
                              status =
                                  'Please check your internet connection and try again';
                            else
                              status =
                                  'Something has gone wrong, please try later';
                          });
                        };

                        final PhoneVerificationCompleted verificationCompleted =
                            (AuthCredential auth) {
                          setState(() {
                            status = 'Auto retrieving verification code';
                          });
                          //_authCredential = auth;

                          firebaseAuth
                              .signInWithCredential(_authCredential)
                              .then((AuthResult value) {
                            if (value.user != null) {
                              setState(() {
                                status = 'Authentication successful';
                              });
                              onAuthenticationSuccessful(context);
                            } else {
                              setState(() {
                                status = 'Invalid code/invalid authentication';
                              });
                            }
                          }).catchError((error) {
                            setState(() {
                              status =
                                  'Something has gone wrong, please try later';
                            });
                          });
                        };

                        firebaseAuth.verifyPhoneNumber(
                            phoneNumber: phone.toString(),
                            timeout: Duration(seconds: 60),
                            verificationCompleted: verificationCompleted,
                            verificationFailed: verificationFailed,
                            codeSent: codeSent,
                            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => EditDetails(),
//                    ),
//                  );
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                onChanged: (value) {
                  smsCode = value;
                },
                decoration: kInputStyle.copyWith(hintText: 'OTP'),
              ),
              SizedBox(height: 25.0),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Proceed',
                onPressed: () async {
                  void _signInWithPhoneNumber(String smsCode) async {
                    _authCredential = await PhoneAuthProvider.getCredential(
                        verificationId: actualCode, smsCode: smsCode);
                    print("Actual Code: $actualCode");
                    print("Sms Code: $smsCode");
                    try {
                      final user =
                          await _auth.signInWithCredential(_authCredential);
                      if (user != null) {
                        setState(() {
                          print('successs');
                          status = 'Authentication successful';
                        });
                        onAuthenticationSuccessful(context);
                      }
                    } catch (e) {
                      print(e);
                    }
//                    final user = await firebaseAuth
//                        .signInWithCredential(_authCredential)
//                        .then((AuthResult auth) async {
//                      setState(() {
//                        print('successs');
//                        status = 'Authentication successful';
//                      });
//                      if (user != null) {
//                        onAuthenticationSuccessful(context);
//                      } else {
//                        print('null user');
//                      }
//                    }).catchError((error) {
//                      setState(() {
//                        print(phone);
//                        print(smsCode);
//                        print('errrrror');
//                        print(error);
//                        status = 'Something has gone wrong, please try later';
//                      });
//                    });
                  }

                  _signInWithPhoneNumber(smsCode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
