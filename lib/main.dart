import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_chat/screens/chat_screen.dart';
import 'package:group_chat/screens/login_page.dart';
import 'package:group_chat/screens/signup_page.dart';
import './screens/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.white,
        accentColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
