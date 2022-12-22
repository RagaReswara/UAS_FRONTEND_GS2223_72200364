
import 'package:flutter/material.dart';
import 'package:uas_frontend_flutter/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_frontend_flutter/splashScreen.dart';

void main() {
  void main() {
    runApp(const MyApp());
    runApp(const MaterialApp(
      home: Splashscreen(title: 'Demo App'),
    ));
  }
}