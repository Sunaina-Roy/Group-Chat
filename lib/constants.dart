import 'package:flutter/material.dart';

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  hintText: 'Type your message here',
  border: InputBorder.none,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.indigo,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const kMessageContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.indigo, width: 2.0)));
