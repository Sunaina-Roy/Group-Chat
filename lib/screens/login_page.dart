import 'package:flutter/material.dart';
import 'package:group_chat/animation/Fade_animation.dart';
import 'package:group_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        opacity: 0.6,
        color: Colors.grey[100],
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.grey[500],
        ),
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          padding: EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          'Login to Group Chat',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          'login to fire up conversations!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.2,
                        makeInput(
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      FadeAnimation(
                        1.3,
                        makeInput(
                          keyboardType: TextInputType.text,
                          label: 'Password',
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimation(
                    1.4,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                            top: BorderSide(
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              color: Colors.black,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final loginUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (loginUser != null) {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          color: Colors.blueGrey[100],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/login1.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, onChanged, keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 15,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300],
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey[600],
              ))),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
