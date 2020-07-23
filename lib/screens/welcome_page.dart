import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_chat/animation/Fade_animation.dart';
import 'package:group_chat/screens/login_page.dart';
import 'package:group_chat/screens/signup_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../reusables/button_card.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(
      begin: Color(0XFFE4E4E4),
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: animation.value,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Group Chat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 200),
                    text: [
                      'An interface which enables you to stay in touch with your loved ones!',
                      'Login',
                      'Connect',
                      'Chat with friends',
                      'Flutter with FireBase app by Sunaina',
                    ],
                    repeatForever: true,
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                  1.3,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/homepage.png',
                        ),
                      ),
                    ),
                  )),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.4,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.5,
                      Container(
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
                        child: RoundedButton(
                          title: 'Signup',
                          colour: Colors.indigo[100],
                          onPressed: () {
                            Navigator.pushNamed(context, SignupPage.id);
                          },
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
